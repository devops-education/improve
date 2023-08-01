package org.persapiens.improve.persistence;

import java.util.List;
import org.persapiens.improve.domain.Recommendation;

public interface RecommendationRepositoryCustom {
    List<Recommendation> findByOrderByRecommendationInterviewsSizeDesc();
    List<Recommendation> findByLeftJoinLinksOrderByRecommendationInterviewsSizeDesc();
}
