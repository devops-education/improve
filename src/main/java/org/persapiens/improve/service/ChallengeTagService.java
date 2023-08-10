package org.persapiens.improve.service;

import java.util.Set;
import java.util.stream.Collectors;
import org.persapiens.improve.domain.Challenge;
import org.persapiens.improve.domain.ChallengeTag;
import org.persapiens.improve.domain.ChallengeTagId;
import org.springframework.stereotype.Service;

@Service
public class ChallengeTagService extends InMemoryCrudService <ChallengeTag, ChallengeTagId> {
    public Set<ChallengeTag> findByChallenge(Challenge challenge) {
        return getBeans().values().stream().filter( t -> t.getChallenge().equals(challenge))
            .collect(Collectors.toSet());
    }
}
