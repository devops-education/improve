package org.persapiens.improve.persistence;

import java.util.List;
import org.persapiens.improve.domain.ChallengeRecommendationConflict;
import org.persapiens.improve.domain.Recommendation;
import org.persapiens.improve.domain.RecommendationsConflict;
import org.persapiens.improve.domain.RecommendationsConflictId;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.QueryByExampleExecutor;

public interface RecommendationsConflictRepository extends CrudRepository<RecommendationsConflict, RecommendationsConflictId>, 
            QueryByExampleExecutor<ChallengeRecommendationConflict> {
    List<ChallengeRecommendationConflict> findByRecommendation1OrRecommendation2(Recommendation recommendation1, Recommendation recommendation2);
}
