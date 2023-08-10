package org.persapiens.improve.service;

import java.util.Set;
import java.util.stream.Collectors;
import lombok.Getter;
import org.persapiens.improve.domain.Challenge;
import org.persapiens.improve.domain.ChallengeRecommendationConflict;
import org.persapiens.improve.domain.ChallengeRecommendationConflictId;
import org.persapiens.improve.domain.Recommendation;
import org.persapiens.improve.persistence.ChallengeRecommendationConflictRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChallengeRecommendationConflictService extends InMemoryCrudService <ChallengeRecommendationConflict, ChallengeRecommendationConflictId> {
    @Getter
    @Autowired
    private ChallengeRecommendationConflictRepository repository;

    public Set<ChallengeRecommendationConflict> findByChallenge(Challenge challenge) {
        return getBeans().values().stream().filter( t -> t.getChallenge().equals(challenge))
            .collect(Collectors.toSet());
    }

    public Set<ChallengeRecommendationConflict> findByRecommendation(Recommendation recommendation) {
        return getBeans().values().stream().filter( t -> t.getRecommendation().equals(recommendation))
            .collect(Collectors.toSet());
    }
}
