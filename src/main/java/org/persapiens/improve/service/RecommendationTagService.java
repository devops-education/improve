package org.persapiens.improve.service;

import java.util.Set;
import java.util.stream.Collectors;
import org.persapiens.improve.domain.Recommendation;
import org.persapiens.improve.domain.RecommendationTag;
import org.persapiens.improve.domain.RecommendationTagId;
import org.springframework.stereotype.Service;

@Service
public class RecommendationTagService extends InMemoryCrudService <RecommendationTag, RecommendationTagId> {
    public Set<RecommendationTag> findByRecommendation(Recommendation recommendation) {
        return getBeans().values().stream().filter( t -> t.getRecommendation().equals(recommendation))
            .collect(Collectors.toSet());
    }
}
