package org.persapiens.improve.service;

import java.util.Collection;
import org.persapiens.improve.domain.Recommendation;
import org.persapiens.improve.domain.RecommendationInterview;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecommendationSearchService extends SearchService<Recommendation>{
    
    @Autowired
    private RecommendationService recommendationService;

    @Override
    protected long count() {
        return recommendationService.count();
    }

    @Override
    protected Collection<Recommendation> findAll() {
        return recommendationService.findByOrderByRecommendationInterviewsSizeDesc();
    }

    @Override
    protected String description(Recommendation t) {
        StringBuilder sb = new StringBuilder();
        StringBuilder riquotes = new StringBuilder();
        StringBuilder riresumes = new StringBuilder();
        for (RecommendationInterview ri : t.getRecommendationInterviews()) {
            riquotes = riquotes.append(' ').append(ri.getQuote());
            riresumes = riresumes.append(' ').append(ri.getResume());
        }
        return sb.append(t.getMainIdea())
            .append(' ').append(t.getTheme().toString())
            .append(' ').append(t.getCode())
            .append(' ').append(t.getTags())
            .append(' ').append(riquotes)
            .append(' ').append(riresumes)
            .toString();
    }
}
