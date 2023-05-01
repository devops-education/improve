package org.persapiens.crde.view.crud;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.faces.view.ViewScoped;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lombok.extern.java.Log;

import org.persapiens.crde.domain.Recommendation;
import org.persapiens.crde.domain.RecommendationFeedback;
import org.persapiens.crde.persistence.RecommendationFeedbackRepository;
import org.persapiens.crde.persistence.RecommendationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Log
@ViewScoped
@Component
public class RecommendationFeedbackCrudMBean extends CrudMBean<RecommendationFeedback, Long> {

    private static final long serialVersionUID = 1L;

    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private RecommendationRepository recommendationRepository;
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private RecommendationFeedbackRepository recommendationFeedbackRepository;
    
    @Override
    protected RecommendationFeedback createBean() {
        return RecommendationFeedback.builder().build();
    }

    @Override
    public boolean isCheckStartInsert(RecommendationFeedback bean) {
        return false;
    }

    @Override
    public boolean isCheckStartUpdate(RecommendationFeedback bean) {
        return false;
    }

    @Override
    public List<RecommendationFeedback> find() {
        // create recommendationFeedback map
        Map<Recommendation, RecommendationFeedback> recommendationFeedbackMap = new HashMap<>();
        for(RecommendationFeedback recommendationFeedback : recommendationFeedbackRepository.findByUsername(username())) {
            recommendationFeedbackMap.put(recommendationFeedback.getRecommendation(), recommendationFeedback);
        }

        // create all recommendationFeedback from recommendation and previous feedback
        List<RecommendationFeedback> result = new ArrayList<>();
        for(Recommendation recommendation : recommendationRepository.findByOrderByAmountOfInterviewsDesc()) {
            RecommendationFeedback recommendationFeedback = recommendationFeedbackMap.get(recommendation);
            if (recommendationFeedback == null) {
                recommendationFeedback = RecommendationFeedback.builder()
                        .recommendation(recommendation)
                        .username(username())
                        .build();
            } else {
                log.warning("RecommendationFeedback " + recommendationFeedback.getRating());
            }
            result.add(recommendationFeedback);
        }

        return result;
    }
 
    private String username() {
        return "marcelo";
    }

    public void onrate(RecommendationFeedback recommendationFeedback) {
        recommendationFeedbackRepository.save(recommendationFeedback);
        String message = "You rated " + recommendationFeedback.getRating().getDescription();
        addInfoMessage(null, message, message);
    }
    
    public void oncancel(RecommendationFeedback recommendationFeedback) {
        if (recommendationFeedback.getId() != null) {
            recommendationFeedbackRepository.delete(recommendationFeedback);
        }
        recommendationFeedback.setRating(null);
        recommendationFeedback.setId(null);
        String message = "You cancelled!";
        addInfoMessage(null, message, message);        
    }
    
}
