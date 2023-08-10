package org.persapiens.improve.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.persapiens.improve.domain.Recommendation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecommendationService extends InMemoryCrudService <Recommendation, Long> {

    @Autowired
    private RecommendationTagService recommendationTagService;

    @Autowired
    private RecommendationInterviewService recommendationInterviewService;

    @Autowired
    private LinkService linkService;

    @Autowired
    private ChallengeRecommendationConflictService challengeRecommendationConflictService;

    @Autowired
    private RecommendationsConflictService recommendationsConflictService;
    
    @Override
    protected Recommendation fill(Recommendation result) {
        result = super.fill(result); 
        
        result = fillRecommendationTags(result);
        
        result = fillRecommendationInterviews(result);
        
        result = fillLinks(result);
        
        result = fillChallengeConflicts(result);
        
        result = fillRecommendationConflicts(result);
        
        return result;
    }

    private Recommendation fillRecommendationTags(Recommendation result) {
        result.setRecommendationTags(recommendationTagService.findByRecommendation(result));
        
        return result;
    }

    private Recommendation fillRecommendationInterviews(Recommendation result) {
        result.setRecommendationInterviews(recommendationInterviewService.findByRecommendation(result));
        
        return result;
    }

    private Recommendation fillLinks(Recommendation result) {
        result.setLinks(linkService.findByRecommendation(result));
        
        return result;
    }

    private Recommendation fillChallengeConflicts(Recommendation result) {
        result.setChallengeConflicts(challengeRecommendationConflictService.findByRecommendation(result));
        
        return result;
    }

    private Recommendation fillRecommendationConflicts(Recommendation result) {
        result.setRecommendation1Conflicts(recommendationsConflictService.findByRecommendation1(result));
        result.setRecommendation2Conflicts(recommendationsConflictService.findByRecommendation2(result));
        
        return result;
    }

    public List<Recommendation> findByOrderByRecommendationInterviewsSizeDesc() {
        List<Recommendation> result = new ArrayList<>(getBeans().values());
        Collections.sort(result, (Recommendation o1, Recommendation o2) -> 
            o2.getRecommendationInterviews().size() - o1.getRecommendationInterviews().size());
        return result;
    }
    
}
