package br.edu.ifrn.cr.persistence;

import br.edu.ifrn.cr.domain.ChallengeTag;
import br.edu.ifrn.cr.domain.ChallengeTagId;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.QueryByExampleExecutor;

public interface ChallengeTagRepository extends CrudRepository<ChallengeTag, ChallengeTagId>, QueryByExampleExecutor<ChallengeTag> {
}
