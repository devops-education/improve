package org.persapiens.improve.service;

import java.util.Collection;
import java.util.List;
import org.persapiens.improve.domain.Recommendation;
import org.persapiens.improve.domain.RecommendationFeedback;
import org.persapiens.improve.persistence.RecommendationFeedbackRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecommendationFeedbackService extends CrudService <RecommendationFeedback, Long> {

    @Autowired
    private RecommendationFeedbackRepository recommendationFeedbackRepository;
    
    @Autowired
    private RecommendationService recommendationService;
    
    private List<RecommendationFeedback> fill(List<RecommendationFeedback> result) {
        for (RecommendationFeedback bean : result) {
            bean.setRecommendation(recommendationService.findById(bean.getRecommendation().getId()).get());
        }
        
        return result;
    }
    
    public List<RecommendationFeedback> findByUsername(String username) {
        return fill(recommendationFeedbackRepository.findByUsername(username));
    }
    
    public List<RecommendationFeedback> findByRecommendationInAndUsername(Collection<Recommendation> recommendation, String username) {
        return fill(recommendationFeedbackRepository.findByRecommendationInAndUsername(recommendation, username));
    }
    
}
