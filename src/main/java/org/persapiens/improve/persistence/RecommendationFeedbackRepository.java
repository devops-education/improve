package org.persapiens.improve.persistence;

import java.util.Collection;
import java.util.List;
import org.persapiens.improve.domain.Recommendation;
import org.persapiens.improve.domain.RecommendationFeedback;
import org.persapiens.improve.domain.User;

import org.springframework.data.repository.CrudRepository;

public interface RecommendationFeedbackRepository extends CrudRepository<RecommendationFeedback, Long> {

	List<RecommendationFeedback> findByUser(User user);

	List<RecommendationFeedback> findByRecommendationInAndUser(Collection<Recommendation> recommendations, User user);

}
