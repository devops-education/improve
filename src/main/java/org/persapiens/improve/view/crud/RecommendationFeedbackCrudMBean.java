package org.persapiens.improve.view.crud;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.faces.view.ViewScoped;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.apache.lucene.queryparser.classic.ParseException;
import org.persapiens.improve.domain.Challenge;
import org.persapiens.improve.domain.ChallengeFeedback;
import org.persapiens.improve.domain.Link;

import org.persapiens.improve.domain.Recommendation;
import org.persapiens.improve.domain.RecommendationFeedback;
import org.persapiens.improve.domain.RecommendationsConflict;
import org.persapiens.improve.service.LinkService;
import org.persapiens.improve.service.RecommendationSearchService;
import org.persapiens.improve.service.RecommendationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@ViewScoped
@Component
public class RecommendationFeedbackCrudMBean extends AbstractFeedbackCrudMBean<RecommendationFeedback> {

    private static final long serialVersionUID = 1L;
    private static final String SE_BAD_FIELD = "SE_BAD_FIELD";

    @SuppressFBWarnings(SE_BAD_FIELD)
    @Autowired
    private RecommendationService recommendationService;
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private LinkService linkService;
    
    @SuppressFBWarnings(SE_BAD_FIELD)
    @Autowired
    private RecommendationSearchService recommendationSearchService;
    
    @Getter
    @Setter
    private List<LinkChallengeFeedback> linkChallengeFeedbackList;
    
    @Getter
    @Setter
    private List<RecommendationsConflict> recommendationsConflictList;
    
    @Override
    protected RecommendationFeedback createBean() {
        return RecommendationFeedback.builder().build();
    }

    @Override
    protected boolean doGlobalFilterFunction(RecommendationFeedback value, String filterText, Locale locale) throws ParseException, IOException {
        return recommendationSearchService.search(filterText, value.getRecommendation().getId());
    }

    @Override
    public List<RecommendationFeedback> find() {
        // create recommendationFeedback map
        Map<Recommendation, RecommendationFeedback> recommendationFeedbackMap = new HashMap<>();
        for(RecommendationFeedback recommendationFeedback : recommendationFeedbackService.findByUsername(username())) {
            recommendationFeedbackMap.put(recommendationFeedback.getRecommendation(), recommendationFeedback);
        }

        Iterable<Link> iterable = linkService.findAll();
        
        Map<Recommendation, List<Link>> recommendationLinkMap = StreamSupport.stream(iterable.spliterator(), false).collect(Collectors.groupingBy(Link::getRecommendation));
        Map<Challenge, List<Link>> challengeLinkMap = StreamSupport.stream(iterable.spliterator(), false).collect(Collectors.groupingBy(Link::getChallenge));
        
        // create all recommendationFeedback from recommendation and previous feedback
        List<RecommendationFeedback> result = new ArrayList<>();
        for(Recommendation recommendation : recommendationService.findByOrderByRecommendationInterviewsSizeDesc()) {
            RecommendationFeedback recommendationFeedback = recommendationFeedbackMap.get(recommendation);
            if (recommendationFeedback == null) {
                recommendationFeedback = RecommendationFeedback.builder()
                        .recommendation(recommendation)
                        .username(username())
                        .build();
            } else {
                log.debug("RecommendationFeedback " + recommendationFeedback.getKnown());
            }
            
            Set<Link> links = new HashSet<>();
            if (recommendationLinkMap.containsKey(recommendation)) {
                links.addAll(recommendationLinkMap.get(recommendation));
            }
            
            recommendationFeedback.getRecommendation().setLinks(links);
            for(Link link : links) {
                Challenge challenge = link.getChallenge();
                Set<Link> challengeLinks = new HashSet<>();
                if (challengeLinkMap.containsKey(challenge)) {
                    challengeLinks.addAll(challengeLinkMap.get(challenge));
                }
                challenge.setLinks(challengeLinks);
            }
            result.add(recommendationFeedback);
        }

        return result;
    }

    @Override
    public void startDetailAction() {
        super.startDetailAction(); 
        
        // recuperando os recommendation feedback dos links do desafio
        Map<Challenge, ChallengeFeedback> challengeChallengeFeedbackMap = challengeFeedbackService.findByChallengeInAndUsername(
    getBean().getRecommendation().getLinkSortedByChallengeChallengeInterviewsSizeList().stream().
                map(Link::getChallenge).collect(Collectors.toList()), username())
                    .stream().collect(Collectors.toMap(ChallengeFeedback::getChallenge, Function.identity()));

        List<LinkChallengeFeedback> newLinkChallengeFeedbackList = new ArrayList<>();
        
        // varrendo os links do desafio
        for (Link link : getBean().getRecommendation().getLinkSortedByChallengeChallengeInterviewsSizeList()) {
            Challenge challenge = link.getChallenge();
            ChallengeFeedback challengeFeedback = challengeChallengeFeedbackMap.get(challenge);
            if (challengeFeedback == null) {
                challengeFeedback = ChallengeFeedback.builder()
                    .challenge(challenge)
                    .username(username())
                    .build();
            }
            
            newLinkChallengeFeedbackList.add(LinkChallengeFeedback.builder()
                    .link(link)
                    .challengeFeedback(challengeFeedback)
                    .build());                    
        }
        
        setLinkChallengeFeedbackList(newLinkChallengeFeedbackList);
    }    
        
}
