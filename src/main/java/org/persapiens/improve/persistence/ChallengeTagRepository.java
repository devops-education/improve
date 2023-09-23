package org.persapiens.improve.persistence;

import org.persapiens.improve.domain.ChallengeTag;
import org.persapiens.improve.domain.ChallengeTagId;

import org.springframework.data.repository.CrudRepository;

public interface ChallengeTagRepository extends CrudRepository<ChallengeTag, ChallengeTagId> {

}
