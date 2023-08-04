package org.persapiens.improve.view.crud;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.faces.view.ViewScoped;
import java.util.Arrays;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.persapiens.improve.domain.RecommendationFeedback;
import org.persapiens.improve.persistence.RecommendationFeedbackRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@ViewScoped
@Component
public class RecommendationFeedbackSummaryCrudMBean extends AbstractFeedbackSummaryCrudMBean<RecommendationFeedback> {

    private static final long serialVersionUID = 1L;
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private RecommendationFeedbackRepository recommendationFeedbackRepository;
    
    @Override
    public List<RecommendationFeedback> find() {
        return recommendationFeedbackRepository.findByUsernameAndUsedAlreadyIsFalseAndWillUseIsTrueOrderByKnownAsc(username());
    }

    @Override
    protected RecommendationFeedback createBean() {
        return RecommendationFeedback.builder().build();
    }

    @Override
    protected RecommendationFeedback getDetailBean(RecommendationFeedback bean) {
        return recommendationFeedbackRepository.findDetailById(bean.getId()).get(); 
    }

    @Override
    protected List<Number> values() {
        List<RecommendationFeedback> feedbacks = recommendationFeedbackRepository.findByUsername(username());
        
        Number usedAlreadyCount = feedbacks.stream().filter(RecommendationFeedback::getUsedAlready).count();
        Number notUsedAndWillUseCount = feedbacks.stream().filter(rf -> !rf.getUsedAlready() && rf.getWillUse()).count();
        Number notUsedAndNotWillUseCount = feedbacks.stream().filter( rf -> !rf.getUsedAlready() && !rf.getWillUse()).count();
        return Arrays.asList(usedAlreadyCount, notUsedAndWillUseCount, notUsedAndNotWillUseCount);
    }

    @Override
    protected List<String> backgourndColors() {
        return Arrays.asList("blue", "green", "orange");
    }

    @Override
    protected List<String> labels() {
        return Arrays.asList("Used",
                             "Not used and will use",
                             "Not used and won't use");
    }
}
