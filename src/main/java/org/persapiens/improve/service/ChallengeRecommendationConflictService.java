package org.persapiens.improve.service;

import java.util.Set;
import java.util.stream.Collectors;
import org.persapiens.improve.domain.Challenge;
import org.persapiens.improve.domain.ChallengeRecommendationConflict;
import org.persapiens.improve.domain.ChallengeRecommendationConflictId;
import org.persapiens.improve.domain.Recommendation;
import org.springframework.stereotype.Service;

@Service
public class ChallengeRecommendationConflictService extends InMemoryCrudService <ChallengeRecommendationConflict, ChallengeRecommendationConflictId> {
    public Set<ChallengeRecommendationConflict> findByChallenge(Challenge challenge) {
        return getBeans().values().stream().filter( t -> t.getChallenge().equals(challenge))
            .collect(Collectors.toSet());
    }

    public Set<ChallengeRecommendationConflict> findByRecommendation(Recommendation recommendation) {
        return getBeans().values().stream().filter( t -> t.getRecommendation().equals(recommendation))
            .collect(Collectors.toSet());
    }
}
