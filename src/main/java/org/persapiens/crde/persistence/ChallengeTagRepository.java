package org.persapiens.crde.persistence;

import java.util.List;
import org.persapiens.crde.domain.Challenge;
import org.persapiens.crde.domain.ChallengeTag;
import org.persapiens.crde.domain.ChallengeTagId;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.QueryByExampleExecutor;

public interface ChallengeTagRepository extends CrudRepository<ChallengeTag, ChallengeTagId>, QueryByExampleExecutor<ChallengeTag> {
    List<ChallengeTag> findByChallenge(Challenge challenge);
}
