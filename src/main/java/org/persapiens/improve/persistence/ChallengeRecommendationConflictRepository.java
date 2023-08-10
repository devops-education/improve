package org.persapiens.improve.persistence;

import java.util.List;
import org.persapiens.improve.domain.Challenge;
import org.persapiens.improve.domain.ChallengeRecommendationConflict;
import org.persapiens.improve.domain.ChallengeRecommendationConflictId;
import org.persapiens.improve.domain.Recommendation;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.QueryByExampleExecutor;

public interface ChallengeRecommendationConflictRepository extends CrudRepository<ChallengeRecommendationConflict, ChallengeRecommendationConflictId>, 
            QueryByExampleExecutor<ChallengeRecommendationConflict> {
    List<ChallengeRecommendationConflict> findByChallenge(Challenge challenge);
    List<ChallengeRecommendationConflict> findByRecommendation(Recommendation recommendation);
}
