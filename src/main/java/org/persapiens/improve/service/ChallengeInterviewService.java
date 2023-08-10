package org.persapiens.improve.service;

import java.util.SortedSet;
import java.util.TreeSet;
import java.util.stream.Collectors;
import org.persapiens.improve.domain.Challenge;
import org.persapiens.improve.domain.ChallengeInterview;
import org.persapiens.improve.domain.ChallengeInterviewId;
import org.springframework.stereotype.Service;

@Service
public class ChallengeInterviewService extends InMemoryCrudService <ChallengeInterview, ChallengeInterviewId> {
    public SortedSet<ChallengeInterview> findByChallenge(Challenge challenge) {
        return new TreeSet<>(getBeans().values().stream().filter( t -> t.getChallenge().equals(challenge))
            .collect(Collectors.toSet()));
    }
}
