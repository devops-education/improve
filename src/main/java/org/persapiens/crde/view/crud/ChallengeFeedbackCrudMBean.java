package org.persapiens.crde.view.crud;

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
import java.util.TreeSet;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.apache.lucene.queryparser.classic.ParseException;
import org.persapiens.crde.domain.Challenge;
import org.persapiens.crde.domain.ChallengeFeedback;
import org.persapiens.crde.domain.Link;

import org.persapiens.crde.domain.Recommendation;
import org.persapiens.crde.domain.RecommendationFeedback;
import org.persapiens.crde.persistence.ChallengeRepository;
import org.persapiens.crde.persistence.ChallengeTagRepository;
import org.persapiens.crde.persistence.RecommendationInterviewRepository;
import org.persapiens.crde.service.ChallengeSearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@ViewScoped
@Component
public class ChallengeFeedbackCrudMBean extends AbstractFeedbackCrudMBean<ChallengeFeedback> {

    private static final long serialVersionUID = 1L;

    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private ChallengeRepository challengeRepository;

    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private RecommendationInterviewRepository recommendationInterviewRepository;
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private ChallengeTagRepository challengeTagRepository;
    
    @Getter
    @Setter
    private List<LinkRecommendationFeedback> linkRecommendationFeedbackList;
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private ChallengeSearchService challengeSearchService;
    
    @Override
    protected ChallengeFeedback createBean() {
        return ChallengeFeedback.builder().build();
    }

    @Override
    public List<ChallengeFeedback> find() {
        // create challengeFeedback map
        Map<Challenge, ChallengeFeedback> challengeFeedbackMap = new HashMap<>();
        for(ChallengeFeedback challengeFeedback : challengeFeedbackRepository.findByUsername(username())) {
            challengeFeedbackMap.put(challengeFeedback.getChallenge(), challengeFeedback);
        }

        Iterable<Link> iterable = linkRepository.findAll();
        
        Map<Recommendation, List<Link>> recommendationLinkMap = StreamSupport.stream(
    iterable.spliterator(), false).collect(Collectors.groupingBy(Link::getRecommendation));
        Map<Challenge, List<Link>> challengeLinkMap = StreamSupport.stream(
    iterable.spliterator(), false).collect(Collectors.groupingBy(Link::getChallenge));
        
        // create all challengeFeedback from challenge and previous feedback
        List<ChallengeFeedback> result = new ArrayList<>();
        for(Challenge challenge : challengeRepository.findByOrderByChallengeInterviewsSizeDesc()) {
            ChallengeFeedback challengeFeedback = challengeFeedbackMap.get(challenge);
            if (challengeFeedback == null) {
                challengeFeedback = ChallengeFeedback.builder()
                        .challenge(challenge)
                        .username(username())
                        .build();
            } else {
                log.debug("ChallengeFeedback " + challengeFeedback.getKnown());
            }
            
            Set<Link> links = new HashSet<>();
            if (challengeLinkMap.containsKey(challenge)) {
                links.addAll(challengeLinkMap.get(challenge));
            }
            
            challengeFeedback.getChallenge().setLinks(links);
            for(Link link : links) {
                Recommendation recommendation = link.getRecommendation();
                Set<Link> recommendationLinks = new HashSet<>();
                if (recommendationLinkMap.containsKey(recommendation)) {
                    recommendationLinks.addAll(recommendationLinkMap.get(recommendation));
                }
                recommendation.setLinks(recommendationLinks);
            }
            result.add(challengeFeedback);
        }

        return result;
    }

    @Override
    protected boolean doGlobalFilterFunction(ChallengeFeedback value, String filterText, Locale locale) throws ParseException, IOException {
        return challengeSearchService.search(filterText, value.getChallenge().getId());
    }

    @Override
    protected ChallengeFeedback getDetailBean(ChallengeFeedback bean) {
        for(Link link : bean.getChallenge().getLinks()) {
            Recommendation recommendation = link.getRecommendation();
            recommendation.setRecommendationInterviews(new TreeSet<>(recommendationInterviewRepository.findByRecommendation(recommendation)));
        }
        return bean;
    }
    
    @Override
    public void startDetailAction() {
        super.startDetailAction(); 
        
        List<LinkRecommendationFeedback> newLinkRecommendationFeedbackList = new ArrayList<>();
        
        // recuperando os recommendation feedback dos links do desafio
        Map<Recommendation, RecommendationFeedback> recommendationRecommendationFeedbackMap = recommendationFeedbackRepository.findByRecommendationInAndUsername(
getBean().getChallenge().getLinkSortedByRecommendationRecommendationInterviewsSizeList().stream().map(Link::getRecommendation).collect(Collectors.toList()), username())
                .stream().collect(Collectors.toMap(RecommendationFeedback::getRecommendation, Function.identity()));
        
        // varrendo os links do desafio
        for (Link link : getBean().getChallenge().getLinkSortedByRecommendationRecommendationInterviewsSizeList()) {
            Recommendation recommendation = link.getRecommendation();
            RecommendationFeedback recommendationFeedback = recommendationRecommendationFeedbackMap.get(recommendation);
            if (recommendationFeedback == null) {
                recommendationFeedback = RecommendationFeedback.builder()
                    .recommendation(recommendation)
                    .username(username())
                    .build();
            }

            newLinkRecommendationFeedbackList.add(LinkRecommendationFeedback.builder()
                    .link(link)
                    .recommendationFeedback(recommendationFeedback)
                    .build());                    
        }
        setLinkRecommendationFeedbackList(newLinkRecommendationFeedbackList);
        
        getBean().getChallenge().setChallengeTags(new HashSet<>(challengeTagRepository.findByChallenge(
    getBean().getChallenge())));
    }    
    
}
