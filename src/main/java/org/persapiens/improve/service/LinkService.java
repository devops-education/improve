package org.persapiens.improve.service;

import java.util.SortedSet;
import java.util.TreeSet;
import java.util.stream.Collectors;
import org.persapiens.improve.domain.Challenge;
import org.persapiens.improve.domain.Link;
import org.persapiens.improve.domain.LinkId;
import org.persapiens.improve.domain.Recommendation;
import org.springframework.stereotype.Service;

@Service
public class LinkService extends InMemoryCrudService <Link, LinkId> {
    public SortedSet<Link> findByChallenge(Challenge challenge) {
        return new TreeSet<>(getBeans().values().stream().filter( t -> t.getChallenge().equals(challenge))
            .collect(Collectors.toSet()));
    }

    public SortedSet<Link> findByRecommendation(Recommendation recommendation) {
        return new TreeSet<>(getBeans().values().stream().filter( t -> t.getRecommendation().equals(recommendation))
            .collect(Collectors.toSet()));
    }
}
