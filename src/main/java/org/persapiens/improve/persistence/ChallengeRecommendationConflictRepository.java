package org.persapiens.improve.persistence;

import org.persapiens.improve.domain.ChallengeRecommendationConflict;
import org.persapiens.improve.domain.ChallengeRecommendationConflictId;

import org.springframework.data.repository.CrudRepository;

public interface ChallengeRecommendationConflictRepository extends CrudRepository<ChallengeRecommendationConflict, ChallengeRecommendationConflictId> {
}
