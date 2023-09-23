package org.persapiens.improve.persistence;

import org.persapiens.improve.domain.RecommendationInterview;
import org.persapiens.improve.domain.RecommendationInterviewId;

import org.springframework.data.repository.CrudRepository;

public interface RecommendationInterviewRepository
		extends CrudRepository<RecommendationInterview, RecommendationInterviewId> {

}
