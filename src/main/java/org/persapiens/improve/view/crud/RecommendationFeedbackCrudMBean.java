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
import org.persapiens.improve.domain.RecommendationsConflict;
import org.persapiens.improve.service.LinkService;
import org.persapiens.improve.service.RecommendationSearchService;
import org.persapiens.improve.service.RecommendationService;
import org.persapiens.improve.view.bean.ViewLogMBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@ViewScoped
@Component
public class RecommendationFeedbackCrudMBean extends AbstractFeedbackCrudMBean<RecommendationFeedback> {

    private static final long serialVersionUID = 1L;

    @Autowired
    private RecommendationService recommendationService;
    
    @Autowired
    private LinkService linkService;
    
    @Autowired
    private RecommendationSearchService recommendationSearchService;
    
    @Autowired
    private ViewLogMBean viewLogMBean;
    
    @Getter
    @Setter
    private List<LinkChallengeFeedback> linkChallengeFeedbackList;
    
    @Getter
    @Setter
    private List<ChallengeRecommendationConflictChallengeFeedback> conflictChallengeFeedbackList;
    
    @Getter
    @Setter
    private List<RecommendationsConflictRecommendationFeedback> conflictRecommendationFeedbackList;
    
    @Override
    protected RecommendationFeedback createBean() {
        return RecommendationFeedback.builder().build();
    }

    @Override
    protected boolean doGlobalFilterFunction(RecommendationFeedback value, String filterText, Locale locale)
            throws ParseException, IOException {
        return recommendationSearchService.search(filterText, value.getRecommendation().getId());
    }

    @Override
    public List<RecommendationFeedback> find() {
        // create recommendationFeedback map
        Map<Recommendation, RecommendationFeedback> recommendationFeedbackMap = new HashMap<>();
        for(RecommendationFeedback recommendationFeedback : recommendationFeedbackService.findByUser(userMBean.getLoggedUser())) {
            recommendationFeedbackMap.put(recommendationFeedback.getRecommendation(), recommendationFeedback);
        }

        Iterable<Link> iterable = linkService.findAll();
        
        Map<Recommendation, List<Link>> recommendationLinkMap = StreamSupport.stream(iterable.spliterator(), false)
            .collect(Collectors.groupingBy(Link::getRecommendation));
        Map<Challenge, List<Link>> challengeLinkMap = StreamSupport.stream(iterable.spliterator(), false)
            .collect(Collectors.groupingBy(Link::getChallenge));
        
        // create all recommendationFeedback from recommendation and previous feedback
        List<RecommendationFeedback> result = new ArrayList<>();
        for(Recommendation recommendation : recommendationService.findByOrderByRecommendationInterviewsSizeDesc()) {
            RecommendationFeedback recommendationFeedback = recommendationFeedback(recommendation, recommendationFeedbackMap);
            
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

    private Map<Challenge, ChallengeFeedback> challengeChallengeFeedbackMap() {
        Set<Challenge> linkedChallenges = getBean().getRecommendation().getLinks().stream().
            map(Link::getChallenge).collect(Collectors.toSet());
        Set<Challenge> challenges = new HashSet<>(linkedChallenges);
        
        Set<Challenge> conflictChallenges = getBean().getRecommendation().getChallengeConflicts().stream()
            .map(ChallengeRecommendationConflict::getChallenge).collect(Collectors.toSet());
        challenges.addAll(conflictChallenges);        
        
        // recuperando os challenges feedback dos links do desafio
        return challengeFeedbackService.findByChallengeInAndUser(challenges, userMBean.getLoggedUser())
            .stream().collect(Collectors.toMap(ChallengeFeedback::getChallenge, Function.identity()));
    }

    private Map<Recommendation, RecommendationFeedback> recommendationRecommendationFeedbackMap() {
        Set<Recommendation> conflict1Recommendations = getBean().getRecommendation().getRecommendation1Conflicts().stream()
            .map(RecommendationsConflict::getRecommendation2).collect(Collectors.toSet());
        Set<Recommendation> recommendations = new HashSet<>(conflict1Recommendations);

        Set<Recommendation> conflict2Recommendations = getBean().getRecommendation().getRecommendation2Conflicts().stream()
            .map(RecommendationsConflict::getRecommendation1).collect(Collectors.toSet());
        recommendations.addAll(conflict2Recommendations);

        // recuperando os challenges feedback dos links do desafio
        return recommendationFeedbackService.findByRecommendationInAndUser(recommendations, userMBean.getLoggedUser())
            .stream().collect(Collectors.toMap(RecommendationFeedback::getRecommendation, Function.identity()));
    }
    
    private void createChallengeFeedbackLists() {
        // recuperando os challenges feedback dos links da recommendacao
        Map<Challenge, ChallengeFeedback> challengeChallengeFeedbackMap = challengeChallengeFeedbackMap();

        List<LinkChallengeFeedback> newLinkChallengeFeedbackList = new ArrayList<>();        
        // varrendo os links da recomendacao
        for (Link link : getBean().getRecommendation().getLinkSortedByChallengeChallengeInterviewsSizeList()) {
            Challenge challenge = link.getChallenge();
            ChallengeFeedback challengeFeedback = challengeFeedback(challenge, challengeChallengeFeedbackMap);
            
            newLinkChallengeFeedbackList.add(LinkChallengeFeedback.builder()
                    .link(link)
                    .challengeFeedback(challengeFeedback)
                    .build());                    
        }        
        setLinkChallengeFeedbackList(newLinkChallengeFeedbackList);
        
        List<ChallengeRecommendationConflictChallengeFeedback> newConflictChallengeFeedbackList = new ArrayList<>();        
        // varrendo os conflitos de desafio
        for (ChallengeRecommendationConflict conflict : getBean().getRecommendation().getChallengeConflicts()) {
            Challenge challenge = conflict.getChallenge();
            ChallengeFeedback challengeFeedback = challengeFeedback(challenge, challengeChallengeFeedbackMap);

            newConflictChallengeFeedbackList.add(ChallengeRecommendationConflictChallengeFeedback.builder()
                    .conflict(conflict)
                    .challengeFeedback(challengeFeedback)
                    .build());                    
        }
        setConflictChallengeFeedbackList(newConflictChallengeFeedbackList);
    }
    
    private void createRecommendationFeedbackLists() {    
        // recuperando os recommendations feedback dos conflitos de recomendacao
        Map<Recommendation, RecommendationFeedback> recommendationRecommendationFeedbackMap = recommendationRecommendationFeedbackMap();
        
        List<RecommendationsConflictRecommendationFeedback> newConflictRecommendationFeedbackList = new ArrayList<>();        
        // varrendo os conflitos de recomendacao
        for (RecommendationsConflict conflict : getBean().getRecommendation().getRecommendation1Conflicts()) {
            Recommendation recommendation = conflict.getRecommendation2();
            RecommendationFeedback recommendationFeedback = recommendationFeedback(recommendation, recommendationRecommendationFeedbackMap);

            newConflictRecommendationFeedbackList.add(RecommendationsConflictRecommendationFeedback.builder()
                    .conflict(conflict)
                    .recommendationFeedback(recommendationFeedback)
                    .build());                    
        }
        for (RecommendationsConflict conflict : getBean().getRecommendation().getRecommendation2Conflicts()) {
            Recommendation recommendation = conflict.getRecommendation1();
            RecommendationFeedback recommendationFeedback = recommendationFeedback(recommendation, recommendationRecommendationFeedbackMap);

            newConflictRecommendationFeedbackList.add(RecommendationsConflictRecommendationFeedback.builder()
                    .conflict(conflict)
                    .recommendationFeedback(recommendationFeedback)
                    .build());                    
        }
        setConflictRecommendationFeedbackList(newConflictRecommendationFeedbackList);
    }
    
    @Override
    public void startUpdateAction() {
        super.startUpdateAction(); 

        createChallengeFeedbackLists();

        createRecommendationFeedbackLists();
        
        createTeachingMethodFeedbackLists(getBean().getRecommendation().getTeachingMethodLinks());
        
        viewLogMBean.logRecommendationDetail(getBean().getRecommendation());
    }    

    @Override
    protected void init() {
        super.init();
        viewLogMBean.logRecommendation();
    }
        
}
