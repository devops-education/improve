package org.persapiens.improve.service;

import java.util.List;
import org.persapiens.improve.domain.Recommendation;
import org.persapiens.improve.domain.RecommendationInterview;
import org.persapiens.improve.persistence.RecommendationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecommendationSearchService extends SearchService<Recommendation>{
    
    @Autowired
    private RecommendationRepository recommendationRepository;

    @Override
    protected long count() {
        return recommendationRepository.count();
    }

    @Override
    protected List<Recommendation> findAll() {
        return recommendationRepository.findByLeftJoinLinksOrderByRecommendationInterviewsSizeDesc();
    }

    @Override
    protected Long id(Recommendation t) {
        return t.getId();
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
