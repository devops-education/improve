package org.persapiens.improve.service;

import java.util.Set;
import java.util.stream.Collectors;
import org.persapiens.improve.domain.Recommendation;
import org.persapiens.improve.domain.RecommendationsConflict;
import org.persapiens.improve.domain.RecommendationsConflictId;
import org.springframework.stereotype.Service;

@Service
public class RecommendationsConflictService extends InMemoryCrudService <RecommendationsConflict, RecommendationsConflictId> {
    public Set<RecommendationsConflict> findByRecommendation1(Recommendation recommendation) {
        return getBeans().values().stream().filter( t -> t.getRecommendation1().equals(recommendation))
            .collect(Collectors.toSet());
    }
    public Set<RecommendationsConflict> findByRecommendation2(Recommendation recommendation) {
        return getBeans().values().stream().filter( t -> t.getRecommendation2().equals(recommendation))
            .collect(Collectors.toSet());
    }
}
