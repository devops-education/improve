package br.edu.ifrn.cr.persistence;

import br.edu.ifrn.cr.domain.RecommendationTag;
import br.edu.ifrn.cr.domain.RecommendationTagId;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.QueryByExampleExecutor;

public interface RecommendationTagRepository extends CrudRepository<RecommendationTag, RecommendationTagId>, QueryByExampleExecutor<RecommendationTag> {

}
