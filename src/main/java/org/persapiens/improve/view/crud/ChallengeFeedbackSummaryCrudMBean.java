package org.persapiens.improve.view.crud;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.faces.view.ViewScoped;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
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

    @Override
    protected ChallengeFeedback createBean() {
        return ChallengeFeedback.builder().build();
    }

    @Override
    protected ChallengeFeedback getDetailBean(ChallengeFeedback bean) {
        return challengeFeedbackRepository.findDetailById(bean.getId()).get(); 
    }

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
    protected List<List<ChallengeFeedback>> lists() {
        List<ChallengeFeedback> willMitigateAndNoRecommendation = new ArrayList<>();
        List<ChallengeFeedback> willMitigateAndHasRecommendation = new ArrayList<>();
        List<ChallengeFeedback> notWillMitigate = new ArrayList<>();
        
        for(ChallengeFeedback cf : challengeFeedbackRepository.findByUsername(username())) {
            if (Objects.nonNull(cf.getWillMitigate())) {
                if (cf.getWillMitigate()) {
                    List<Recommendation> recommendations = recommendations(cf);

                    if (hasRecommendationFeedbackUsedAlreadyOrWillUse(recommendations)) {
                        willMitigateAndHasRecommendation.add(cf);
                    } else {
                        willMitigateAndNoRecommendation.add(cf);
                    }
                } else {
                    notWillMitigate.add(cf);
                }
            }
        }
        
        return Arrays.asList(willMitigateAndNoRecommendation, willMitigateAndHasRecommendation, notWillMitigate);
    }

    @Override
    protected List<String> backgroundColors() {
        return Arrays.asList("orange", "dodgerblue", "gray");
    }

    @Override
    protected List<String> labels() {
        return Arrays.asList("Will mitigate with no used links",
                             "Will mitigate with used links",
                             "No mitigation");
    }

    @Override
    protected List<String> crudTitleTexts() {
        return Arrays.asList("Challenges that you will mitigate, but you use no linked recommendation.",
                             "Challenges that you will mitigate and you use linked recommendation.",
                             "Challenges that you won't mitigate.");
    }

}