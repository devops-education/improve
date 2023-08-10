package org.persapiens.improve.persistence;

import org.persapiens.improve.domain.RecommendationsConflict;
import org.persapiens.improve.domain.RecommendationsConflictId;

import org.springframework.data.repository.CrudRepository;

public interface RecommendationsConflictRepository extends CrudRepository<RecommendationsConflict, RecommendationsConflictId> {
}
