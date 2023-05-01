package org.persapiens.crde.persistence;

import java.util.List;
import org.persapiens.crde.domain.Recommendation;
import org.persapiens.crde.domain.RecommendationFeedback;

import org.springframework.data.repository.CrudRepository;

public interface RecommendationFeedbackRepository extends CrudRepository<RecommendationFeedback, Long> {
    List<RecommendationFeedback> findByUsername(String username);
    List<RecommendationFeedback> findByRecommendationInAndUsername(List<Recommendation> recommendation, String username);
}
