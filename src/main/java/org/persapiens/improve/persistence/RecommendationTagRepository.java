package org.persapiens.improve.persistence;

import org.persapiens.improve.domain.RecommendationTag;
import org.persapiens.improve.domain.RecommendationTagId;
import org.springframework.data.repository.CrudRepository;

public interface RecommendationTagRepository extends CrudRepository<RecommendationTag, RecommendationTagId> {
}
