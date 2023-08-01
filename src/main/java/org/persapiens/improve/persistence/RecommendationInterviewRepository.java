package org.persapiens.improve.persistence;

import java.util.List;
import org.persapiens.improve.domain.Recommendation;
import org.persapiens.improve.domain.RecommendationInterview;
import org.persapiens.improve.domain.RecommendationInterviewId;

import org.springframework.data.repository.CrudRepository;

public interface RecommendationInterviewRepository extends CrudRepository<RecommendationInterview, RecommendationInterviewId> {
    List<RecommendationInterview> findByRecommendation(Recommendation recommendation);
}
