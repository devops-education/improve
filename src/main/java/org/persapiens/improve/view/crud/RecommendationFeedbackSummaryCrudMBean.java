package org.persapiens.improve.view.crud;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.faces.view.ViewScoped;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import lombok.extern.slf4j.Slf4j;
import org.persapiens.improve.domain.RecommendationFeedback;
import org.persapiens.improve.persistence.RecommendationFeedbackRepository;
import org.primefaces.event.ItemSelectEvent;
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
        
        Number usedAlreadyCount = feedbacks.stream()
            .map(RecommendationFeedback::getUsedAlready)
            .filter(Objects::nonNull)
            .filter(b -> b)
            .count();
        Number notUsedAndWillUseCount = feedbacks.stream()
            .filter(rf -> Objects.nonNull(rf.getUsedAlready()) && Objects.nonNull(rf.getWillUse()))
            .filter(rf -> !rf.getUsedAlready() && rf.getWillUse())
            .count();
        Number notUsedAndNotWillUseCount = feedbacks.stream()
            .filter(rf -> Objects.nonNull(rf.getUsedAlready()) && Objects.nonNull(rf.getWillUse()))
            .filter(rf -> !rf.getUsedAlready() && !rf.getWillUse())
            .count();
        return Arrays.asList(notUsedAndWillUseCount, usedAlreadyCount, notUsedAndNotWillUseCount);
    }

    @Override
    protected List<String> backgourndColors() {
        return Arrays.asList("green", "blue", "gray");
    }

    @Override
    protected List<String> labels() {
        return Arrays.asList("Not used and will use",
                             "Used",
                             "Not used and won't use");
    }
    
    public void pieListener(ItemSelectEvent e){
        // change recommendation data 
        System.out.println(e.getItemIndex());
    }
}
