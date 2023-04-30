package org.persapiens.crde.persistence;

import org.persapiens.crde.domain.RecommendationFeedback;

import org.springframework.data.repository.CrudRepository;

public interface RecommendationFeedbackRepository extends CrudRepository<RecommendationFeedback, Long> {
}
