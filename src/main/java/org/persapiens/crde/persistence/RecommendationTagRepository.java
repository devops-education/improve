package org.persapiens.crde.persistence;

import org.persapiens.crde.domain.RecommendationTag;
import org.persapiens.crde.domain.RecommendationTagId;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.QueryByExampleExecutor;

public interface RecommendationTagRepository extends CrudRepository<RecommendationTag, RecommendationTagId>, QueryByExampleExecutor<RecommendationTag> {
}
