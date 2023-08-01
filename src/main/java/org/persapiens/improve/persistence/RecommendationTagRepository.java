package org.persapiens.improve.persistence;

import java.util.List;
import org.persapiens.improve.domain.Recommendation;
import org.persapiens.improve.domain.RecommendationTag;
import org.persapiens.improve.domain.RecommendationTagId;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.QueryByExampleExecutor;

public interface RecommendationTagRepository extends CrudRepository<RecommendationTag, RecommendationTagId>, QueryByExampleExecutor<RecommendationTag> {
    List<RecommendationTag> findByRecommendation(Recommendation recommendation);
}
