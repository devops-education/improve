package org.persapiens.crde.persistence;

import java.util.List;
import org.persapiens.crde.domain.Recommendation;

import org.springframework.data.repository.CrudRepository;

public interface RecommendationRepository extends CrudRepository<Recommendation, Long>, RecommendationRepositoryCustom {
    List<Recommendation> findByOrderByAmountOfInterviewsDesc();
}
