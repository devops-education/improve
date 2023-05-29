package org.persapiens.crde.persistence;

import java.util.List;
import org.persapiens.crde.domain.Recommendation;
import org.persapiens.crde.domain.RecommendationInterview;
import org.persapiens.crde.domain.RecommendationInterviewId;

import org.springframework.data.repository.CrudRepository;

public interface RecommendationInterviewRepository extends CrudRepository<RecommendationInterview, RecommendationInterviewId> {
    List<RecommendationInterview> findByRecommendation(Recommendation recommendation);
}
