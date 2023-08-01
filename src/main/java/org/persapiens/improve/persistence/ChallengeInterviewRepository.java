package org.persapiens.improve.persistence;

import java.util.List;
import org.persapiens.improve.domain.Challenge;
import org.persapiens.improve.domain.ChallengeInterview;
import org.persapiens.improve.domain.ChallengeInterviewId;

import org.springframework.data.repository.CrudRepository;

public interface ChallengeInterviewRepository extends CrudRepository<ChallengeInterview, ChallengeInterviewId> {
    List<ChallengeInterview> findByChallenge(Challenge challenge);
}
