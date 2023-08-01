package org.persapiens.improve.persistence;

import java.util.List;
import org.persapiens.improve.domain.Challenge;
import org.persapiens.improve.domain.ChallengeTag;
import org.persapiens.improve.domain.ChallengeTagId;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.QueryByExampleExecutor;

public interface ChallengeTagRepository extends CrudRepository<ChallengeTag, ChallengeTagId>, QueryByExampleExecutor<ChallengeTag> {
    List<ChallengeTag> findByChallenge(Challenge challenge);
}
