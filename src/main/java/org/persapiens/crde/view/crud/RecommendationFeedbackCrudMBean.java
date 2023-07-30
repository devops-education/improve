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
import org.persapiens.crde.persistence.ChallengeInterviewRepository;
import org.persapiens.crde.persistence.RecommendationRepository;
import org.persapiens.crde.persistence.RecommendationTagRepository;
import org.persapiens.crde.service.RecommendationSearchService;
import org.primefaces.util.LangUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@ViewScoped
@Component
public class RecommendationFeedbackCrudMBean extends AbstractFeedbackCrudMBean<RecommendationFeedback> {

    private static final long serialVersionUID = 1L;

    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private RecommendationRepository recommendationRepository;

    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private ChallengeInterviewRepository challengeInterviewRepository;
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private RecommendationTagRepository recommendationTagRepository;
    
    @Getter
    @Setter
    private List<LinkChallengeFeedback> linkChallengeFeedbackList;
    
    @Autowired
    private RecommendationSearchService recommendationSearchService;
    
    @Override
    protected RecommendationFeedback createBean() {
        return RecommendationFeedback.builder().build();
    }

    @Override
    public List<RecommendationFeedback> find() {
        // create recommendationFeedback map
        Map<Recommendation, RecommendationFeedback> recommendationFeedbackMap = new HashMap<>();
        for(RecommendationFeedback recommendationFeedback : recommendationFeedbackRepository.findByUsername(username())) {
            recommendationFeedbackMap.put(recommendationFeedback.getRecommendation(), recommendationFeedback);
        }

        Iterable<Link> iterable = linkRepository.findAll();
        
        Map<Recommendation, List<Link>> recommendationLinkMap = StreamSupport.stream(iterable.spliterator(), false).collect(Collectors.groupingBy(Link::getRecommendation));
        Map<Challenge, List<Link>> challengeLinkMap = StreamSupport.stream(iterable.spliterator(), false).collect(Collectors.groupingBy(Link::getChallenge));
        
        // create all recommendationFeedback from recommendation and previous feedback
        List<RecommendationFeedback> result = new ArrayList<>();
        for(Recommendation recommendation : recommendationRepository.findByOrderByRecommendationInterviewsSizeDesc()) {
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
    public boolean globalFilterFunction(Object value, Object filter, Locale locale) throws ParseException, IOException {
        String filterText = (filter == null) ? null : filter.toString().trim().toLowerCase();
        if (LangUtils.isBlank(filterText)) {
            return true;
        }

        Recommendation recommendation = ((RecommendationFeedback) value).getRecommendation();

        return recommendationSearchService.search(filterText, recommendation.getId());
        /*
        boolean result = recommendation.getMainIdea().toLowerCase().contains(filterText)
                || recommendation.getTags().toLowerCase().contains(filterText);

        if (!result) {
            for(RecommendationInterview ri : recommendation.getRecommendationInterviews()) {
                result = ri.getResume().toLowerCase().contains(filterText)
                    || ri.getQuote().toLowerCase().contains(filterText);
                if (result) {
                    break;
                }
            }
        }
        return result;
        */
    }

    @Override
    protected RecommendationFeedback getDetailBean(RecommendationFeedback bean) {
        for(Link link : bean.getRecommendation().getLinks()) {
            Challenge challenge = link.getChallenge();
            challenge.setChallengeInterviews(new TreeSet<>(challengeInterviewRepository.findByChallenge(challenge)));
        }
        return bean;
    }    

    @Override
    public void startDetailAction() {
        super.startDetailAction(); 

        List<LinkChallengeFeedback> newLinkChallengeFeedbackList = new ArrayList<>();
        
        // recuperando os recommendation feedback dos links do desafio
        Map<Challenge, ChallengeFeedback> challengeChallengeFeedbackMap = challengeFeedbackRepository.findByChallengeInAndUsername(
            getBean().getRecommendation().getLinkSortedByChallengeChallengeInterviewsSizeList().stream().map(Link::getChallenge).collect(Collectors.toList()), username())
                .stream().collect(Collectors.toMap(ChallengeFeedback::getChallenge, Function.identity()));
        
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
        
        getBean().getRecommendation().setRecommendationTags(new HashSet<>(recommendationTagRepository.findByRecommendation(
            getBean().getRecommendation())));
    }    
        
}
