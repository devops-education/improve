package org.persapiens.improve.persistence;

import org.persapiens.improve.domain.Recommendation;

import org.springframework.data.repository.CrudRepository;

public interface RecommendationRepository extends CrudRepository<Recommendation, Long>, RecommendationRepositoryCustom {
}
