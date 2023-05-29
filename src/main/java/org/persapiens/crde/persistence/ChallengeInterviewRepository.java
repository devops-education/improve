package org.persapiens.crde.persistence;

import java.util.List;
import org.persapiens.crde.domain.Challenge;
import org.persapiens.crde.domain.ChallengeInterview;
import org.persapiens.crde.domain.ChallengeInterviewId;

import org.springframework.data.repository.CrudRepository;

public interface ChallengeInterviewRepository extends CrudRepository<ChallengeInterview, ChallengeInterviewId> {
    List<ChallengeInterview> findByChallenge(Challenge challenge);
}
