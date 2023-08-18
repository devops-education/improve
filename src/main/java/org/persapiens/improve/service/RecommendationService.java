package org.persapiens.improve.service;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import lombok.Getter;
import org.persapiens.improve.domain.ChallengeRecommendationConflict;
import org.persapiens.improve.domain.Link;
import org.persapiens.improve.domain.Recommendation;
import org.persapiens.improve.domain.RecommendationInterview;
import org.persapiens.improve.domain.RecommendationTag;
import org.persapiens.improve.domain.RecommendationsConflict;
import org.persapiens.improve.domain.TeachingMethodLink;
import org.persapiens.improve.persistence.RecommendationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecommendationService extends InMemoryCrudService <Recommendation, Long> {
    @Getter
    @Autowired
    private RecommendationRepository repository;

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

    @Autowired
    private TagService tagService;

    @Autowired
    private InterviewService interviewService;
    
    private ChallengeService challengeService;
    
    @Autowired
    private TeachingMethodLinkService teachingMethodLinkService;
    
    @Autowired
    private TeachingMethodService teachingMethodService;

    @SuppressFBWarnings("EI_EXPOSE_REP2")
    public void setChallengeService(ChallengeService challengeService) {
        this.challengeService = challengeService;
    }

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
        for (RecommendationTag bean: result.getRecommendationTags()) {
            bean.setRecommendation(result);
            bean.setTag(tagService.findById(bean.getTag().getId()).get());
        }
        
        return result;
    }

    private Recommendation fillRecommendationInterviews(Recommendation result) {
        result.setRecommendationInterviews(recommendationInterviewService.findByRecommendation(result));
        for (RecommendationInterview bean: result.getRecommendationInterviews()) {
            bean.setRecommendation(result);
            bean.setInterview(interviewService.findById(bean.getInterview().getId()).get());
        }
        
        return result;
    }

    private Recommendation fillLinks(Recommendation result) {
        result.setLinks(linkService.findByRecommendation(result));
        for (Link bean: result.getLinks()) {
            bean.setRecommendation(result);
            bean.setChallenge(challengeService.findById(bean.getChallenge().getId()).get());
            
            bean.setTeachingMethodLinks(teachingMethodLinkService.findByLink(bean));
            for (TeachingMethodLink teachingMethodLink: bean.getTeachingMethodLinks()) {
                teachingMethodLink.setLink(bean);
                teachingMethodLink.setTeachingMethod(
         teachingMethodService.findById(teachingMethodLink.getTeachingMethod().getId()).get());
            }
        }
        
        return result;
    }

    private Recommendation fillChallengeConflicts(Recommendation result) {
        result.setChallengeConflicts(challengeRecommendationConflictService.findByRecommendation(result));
        for (ChallengeRecommendationConflict bean: result.getChallengeConflicts()) {
            bean.setRecommendation(result);
            bean.setChallenge(challengeService.findById(bean.getChallenge().getId()).get());
        }
        
        return result;
    }

    private Recommendation fillRecommendationConflicts(Recommendation result) {
        result.setRecommendation1Conflicts(recommendationsConflictService.findByRecommendation1(result));
        for (RecommendationsConflict bean: result.getRecommendation1Conflicts()) {
            bean.setRecommendation1(result);
        }
        result.setRecommendation2Conflicts(recommendationsConflictService.findByRecommendation2(result));
        for (RecommendationsConflict bean: result.getRecommendation2Conflicts()) {
            bean.setRecommendation2(result);
        }
        
        return result;
    }

    public List<Recommendation> findByOrderByRecommendationInterviewsSizeDesc() {
        List<Recommendation> result = new ArrayList<>(getBeans().values());
        Collections.sort(result, (Recommendation o1, Recommendation o2) -> 
            o2.getRecommendationInterviews().size() - o1.getRecommendationInterviews().size());
        return result;
    }
    
}
