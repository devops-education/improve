package org.persapiens.improve.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.persapiens.improve.domain.Challenge;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChallengeService extends InMemoryCrudService <Challenge, Long> {

    @Autowired
    private ChallengeTagService challengeTagService;

    @Autowired
    private ChallengeInterviewService challengeInterviewService;

    @Autowired
    private LinkService linkService;

    @Autowired
    private ChallengeRecommendationConflictService challengeRecommendationConflictService;
    
    @Override
    protected Challenge fill(Challenge result) {
        result = super.fill(result); 
        
        result = fillChallengeTags(result);
        
        result = fillChallengeInterviews(result);
        
        result = fillLinks(result);
        
        result = fillConflicts(result);
        
        return result;
    }

    private Challenge fillChallengeTags(Challenge result) {
        result.setChallengeTags(challengeTagService.findByChallenge(result));
        
        return result;
    }

    private Challenge fillChallengeInterviews(Challenge result) {
        result.setChallengeInterviews(challengeInterviewService.findByChallenge(result));
        
        return result;
    }

    private Challenge fillLinks(Challenge result) {
        result.setLinks(linkService.findByChallenge(result));
        
        return result;
    }

    private Challenge fillConflicts(Challenge result) {
        result.setConflicts(challengeRecommendationConflictService.findByChallenge(result));
        
        return result;
    }

    public List<Challenge> findByOrderByChallengeInterviewsSizeDesc() {
        List<Challenge> result = new ArrayList<>(getBeans().values());
        Collections.sort(result, (Challenge o1, Challenge o2) -> 
            o2.getChallengeInterviews().size() - o1.getChallengeInterviews().size());
        return result;
    }
    
}
