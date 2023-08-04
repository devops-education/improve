package org.persapiens.improve.view.crud;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.faces.view.ViewScoped;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import lombok.extern.slf4j.Slf4j;
import org.persapiens.improve.domain.ChallengeFeedback;
import org.persapiens.improve.domain.Link;
import org.persapiens.improve.domain.Recommendation;
import org.persapiens.improve.domain.RecommendationFeedback;
import org.persapiens.improve.persistence.ChallengeFeedbackRepository;
import org.persapiens.improve.persistence.ChallengeTagRepository;
import org.persapiens.improve.persistence.LinkRepository;
import org.persapiens.improve.persistence.RecommendationFeedbackRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@ViewScoped
@Component
public class ChallengeFeedbackSummaryCrudMBean extends AbstractFeedbackSummaryCrudMBean<ChallengeFeedback> {

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
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private ChallengeTagRepository challengeTagRepository;

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

    @Override
    protected ChallengeFeedback getDetailBean(ChallengeFeedback bean) {
        return challengeFeedbackRepository.findDetailById(bean.getId()).get(); 
    }

    @Override
    protected List<Number> values() {
        List<ChallengeFeedback> feedbacks = challengeFeedbackRepository.findByUsername(username());
        
        Long notWillMitigateCount = feedbacks.stream().filter(cf -> !cf.getWillMitigate()).count();
        Long willMitigateCount = feedbacks.size() - notWillMitigateCount;
        Integer willMitigateAndNoRecommendation = find().size();
        Long willMitigateAndHasRecommendation = willMitigateCount - willMitigateAndNoRecommendation;
        return Arrays.asList(notWillMitigateCount, willMitigateAndHasRecommendation, willMitigateAndNoRecommendation);
    }

    @Override
    protected List<String> backgourndColors() {
        return Arrays.asList("gray", "green", "orange");
    }

    @Override
    protected List<String> labels() {
        return Arrays.asList("No mitigation",
                             "Will mitigate with links",
                             "Will mitigate with no links");
    }

}
