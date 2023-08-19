package org.persapiens.improve.view.crud;

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
import org.persapiens.improve.domain.ChallengeRecommendationConflict;
import org.persapiens.improve.domain.Link;

import org.persapiens.improve.domain.Recommendation;
import org.persapiens.improve.domain.RecommendationFeedback;
import org.persapiens.improve.service.LinkService;
import org.persapiens.improve.service.ChallengeSearchService;
import org.persapiens.improve.service.ChallengeService;
import org.persapiens.improve.view.bean.ViewLogMBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@ViewScoped
@Component
public class ChallengeFeedbackCrudMBean extends AbstractFeedbackCrudMBean<ChallengeFeedback> {

    private static final long serialVersionUID = 1L;

    @Autowired
    private ChallengeService challengeService;
    
    @Autowired
    private LinkService linkService;
    
    @Autowired
    private ChallengeSearchService challengeSearchService;
    
    @Autowired
    private ViewLogMBean viewLogMBean;
    
    @Getter
    @Setter
    private List<LinkRecommendationFeedback> linkRecommendationFeedbackList;
    
    @Getter
    @Setter
    private List<ChallengeRecommendationConflictRecommendationFeedback> conflictRecommendationFeedbackList;
    
    @Override
    protected ChallengeFeedback createBean() {
        return ChallengeFeedback.builder().build();
    }

    @Override
    protected boolean doGlobalFilterFunction(ChallengeFeedback value, String filterText, Locale locale) throws ParseException, IOException {
        return challengeSearchService.search(filterText, value.getChallenge().getId());
    }
    
    @Override
    public List<ChallengeFeedback> find() {
        // create challengeFeedback map
        Map<Challenge, ChallengeFeedback> challengeFeedbackMap = new HashMap<>();
        for(ChallengeFeedback challengeFeedback : challengeFeedbackService.findByUser(userMBean.getLoggedUser())) {
            challengeFeedbackMap.put(challengeFeedback.getChallenge(), challengeFeedback);
        }

        Iterable<Link> iterable = linkService.findAll();
        
        Map<Recommendation, List<Link>> recommendationLinkMap = StreamSupport.stream(
    iterable.spliterator(), false).collect(Collectors.groupingBy(Link::getRecommendation));
        Map<Challenge, List<Link>> challengeLinkMap = StreamSupport.stream(
    iterable.spliterator(), false).collect(Collectors.groupingBy(Link::getChallenge));
        
        // create all challengeFeedback from challenge and previous feedback
        List<ChallengeFeedback> result = new ArrayList<>();
        for(Challenge challenge : challengeService.findByOrderByChallengeInterviewsSizeDesc()) {
            ChallengeFeedback challengeFeedback = challengeFeedback(challenge, challengeFeedbackMap);
            
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
    
    private Map<Recommendation, RecommendationFeedback> recommendationRecommendationFeedbackMap() {
        Set<Recommendation> linkedRecommendations = getBean().getChallenge().getLinks().stream()
            .map(Link::getRecommendation).collect(Collectors.toSet());
        Set<Recommendation> recommendations = new HashSet<>(linkedRecommendations);

        Set<Recommendation> conflictRecommendations = getBean().getChallenge().getConflicts().stream()
            .map(ChallengeRecommendationConflict::getRecommendation).collect(Collectors.toSet());
        recommendations.addAll(conflictRecommendations);
        
        // recuperando os recommendation feedback dos links do desafio
        return recommendationFeedbackService.findByRecommendationInAndUser(recommendations, userMBean.getLoggedUser())
            .stream().collect(Collectors.toMap(RecommendationFeedback::getRecommendation, Function.identity()));        
    }

    private void createRecommendationFeedbackLists() {            
        // recuperando os recommendation feedback dos links do desafio
        Map<Recommendation, RecommendationFeedback> recommendationRecommendationFeedbackMap = 
            recommendationRecommendationFeedbackMap();
        
        List<LinkRecommendationFeedback> newLinkRecommendationFeedbackList = new ArrayList<>();        
        // varrendo os links do desafio
        for (Link link : getBean().getChallenge().getLinkSortedByRecommendationRecommendationInterviewsSizeList()) {
            Recommendation recommendation = link.getRecommendation();
            RecommendationFeedback recommendationFeedback = recommendationFeedback(recommendation, recommendationRecommendationFeedbackMap);

            newLinkRecommendationFeedbackList.add(LinkRecommendationFeedback.builder()
                    .link(link)
                    .recommendationFeedback(recommendationFeedback)
                    .build());                    
        }
        setLinkRecommendationFeedbackList(newLinkRecommendationFeedbackList);
        
        List<ChallengeRecommendationConflictRecommendationFeedback> newConflictRecommendationFeedbackList = new ArrayList<>();        
        // varrendo os conflitos do desafio
        for (ChallengeRecommendationConflict conflict : getBean().getChallenge().getConflicts()) {
            Recommendation recommendation = conflict.getRecommendation();
            RecommendationFeedback recommendationFeedback = recommendationFeedback(recommendation, recommendationRecommendationFeedbackMap);

            newConflictRecommendationFeedbackList.add(ChallengeRecommendationConflictRecommendationFeedback.builder()
                    .conflict(conflict)
                    .recommendationFeedback(recommendationFeedback)
                    .build());                    
        }
        setConflictRecommendationFeedbackList(newConflictRecommendationFeedbackList);
    }    
    
    @Override
    public void startUpdateAction() {
        super.startUpdateAction(); 

        createRecommendationFeedbackLists();
        
        createTeachingMethodFeedbackLists(getBean().getChallenge().getTeachingMethodLinks());
        
        viewLogMBean.logChallengeDetail(getBean().getChallenge());
    }
    
    @Override
    protected void init() {
        super.init();
        viewLogMBean.logChallenge();
    }
    
}
