package org.persapiens.crde.view.crud;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.faces.view.ViewScoped;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.persapiens.crde.domain.RecommendationFeedback;
import org.persapiens.crde.persistence.RecommendationFeedbackRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@ViewScoped
@Component
public class RecommendationFeedbackSummaryCrudMBean extends CrudMBean<RecommendationFeedback, Long> {

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

}
