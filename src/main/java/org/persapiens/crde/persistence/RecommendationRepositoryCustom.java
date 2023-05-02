package org.persapiens.crde.persistence;

import java.util.List;
import org.persapiens.crde.domain.Recommendation;

public interface RecommendationRepositoryCustom {
    List<Recommendation> findByLeftJoinLinksOrderByAmountOfInterviewsDesc();
}
