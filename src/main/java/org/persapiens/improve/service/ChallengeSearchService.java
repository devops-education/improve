package org.persapiens.improve.service;

import java.util.List;
import org.persapiens.improve.domain.Challenge;
import org.persapiens.improve.domain.ChallengeInterview;
import org.persapiens.improve.persistence.ChallengeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChallengeSearchService extends SearchService<Challenge> {
    
    @Autowired
    private ChallengeRepository challengeRepository;

    @Override
    protected long count() {
        return challengeRepository.count();
    }

    @Override
    protected List<Challenge> findAll() {
        return challengeRepository.findByOrderByChallengeInterviewsSizeDesc();
    }

    @Override
    protected Long id(Challenge t) {
        return t.getId();
    }

    @Override
    protected String description(Challenge t) {
        StringBuilder sb = new StringBuilder();
        StringBuilder riquotes = new StringBuilder();
        StringBuilder riresumes = new StringBuilder();
        for (ChallengeInterview ri : t.getChallengeInterviews()) {
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
