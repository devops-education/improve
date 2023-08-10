package org.persapiens.improve.service;

import java.util.SortedSet;
import java.util.TreeSet;
import java.util.stream.Collectors;
import org.persapiens.improve.domain.Recommendation;
import org.persapiens.improve.domain.RecommendationInterview;
import org.persapiens.improve.domain.RecommendationInterviewId;
import org.springframework.stereotype.Service;

@Service
public class RecommendationInterviewService extends InMemoryCrudService <RecommendationInterview, RecommendationInterviewId> {
    public SortedSet<RecommendationInterview> findByRecommendation(Recommendation recommendation) {
        return new TreeSet<>(getBeans().values().stream().filter( t -> t.getRecommendation().equals(recommendation))
            .collect(Collectors.toSet()));
    }
}
