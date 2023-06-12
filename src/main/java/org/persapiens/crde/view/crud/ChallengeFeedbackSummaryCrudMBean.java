package org.persapiens.crde.view.crud;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.faces.view.ViewScoped;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import lombok.extern.slf4j.Slf4j;
import org.persapiens.crde.domain.ChallengeFeedback;
import org.persapiens.crde.domain.Link;
import org.persapiens.crde.domain.Recommendation;
import org.persapiens.crde.domain.RecommendationFeedback;
import org.persapiens.crde.persistence.ChallengeFeedbackRepository;
import org.persapiens.crde.persistence.LinkRepository;
import org.persapiens.crde.persistence.RecommendationFeedbackRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@ViewScoped
@Component
public class ChallengeFeedbackSummaryCrudMBean extends CrudMBean<ChallengeFeedback, Long> {

    private static final long serialVersionUID = 1L;
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private ChallengeFeedbackRepository challengeFeedbackRepository;
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private LinkRepository linkRepository;
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private RecommendationFeedbackRepository recommendationFeedbackRepository;
    
    private List<Recommendation> recommendations(ChallengeFeedback challengeFeedback) {
        return linkRepository.findByChallenge(challengeFeedback.getChallenge())
                .stream().map(Link::getRecommendation).collect(Collectors.toList());
    }
    
    private boolean hasRecommendationFeedbackUsedAlreadyOrWillUse(List<Recommendation> recommendations) {
        boolean result = false;
        for (RecommendationFeedback recommendationFeedback : recommendationFeedbackRepository.findByRecommendationInAndUsername(recommendations, username())) {
            if (Boolean.TRUE.equals(recommendationFeedback.getUsedAlready())
                    || Boolean.TRUE.equals(recommendationFeedback.getWillUse())) {
                result = true;
                break;
            }
        }
        return result;
    }
    
    @Override
    public List<ChallengeFeedback> find() {
        List<ChallengeFeedback> result = new ArrayList<>();
        
        for (ChallengeFeedback challengeFeedback : challengeFeedbackRepository.findByUsernameAndWillMitigateIsTrueOrderByKnownAsc(username())) {
            List<Recommendation> recommendations = recommendations(challengeFeedback);
            
            if (!hasRecommendationFeedbackUsedAlreadyOrWillUse(recommendations)) {
                result.add(challengeFeedback);
            }
        }
        
        return result;
    }

    @Override
    protected ChallengeFeedback createBean() {
        return ChallengeFeedback.builder().build();
    }

}
