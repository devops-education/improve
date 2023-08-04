package org.persapiens.improve.view.crud;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.faces.view.ViewScoped;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
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
    protected RecommendationFeedback createBean() {
        return RecommendationFeedback.builder().build();
    }

    @Override
    protected RecommendationFeedback getDetailBean(RecommendationFeedback bean) {
        return recommendationFeedbackRepository.findDetailById(bean.getId()).get(); 
    }

    @Override
    protected List<List<RecommendationFeedback>> lists() {
        List<RecommendationFeedback> notUsedAndWillUseList = new ArrayList<>();
        List<RecommendationFeedback> usedAlreadyList = new ArrayList<>();
        List<RecommendationFeedback> notUsedAndNotWillUseList = new ArrayList<>();
        
        for (RecommendationFeedback rf : recommendationFeedbackRepository.findByUsername(username())) {
            if (Objects.nonNull(rf.getUsedAlready())) {
                if (rf.getUsedAlready()) {
                    usedAlreadyList.add(rf);
                } else if (Objects.nonNull(rf.getWillUse())) {
                    if (rf.getWillUse()) {
                        notUsedAndWillUseList.add(rf);
                    } else {
                        notUsedAndNotWillUseList.add(rf);
                    }
                }
            }
        }
        return Arrays.asList(notUsedAndWillUseList, usedAlreadyList, notUsedAndNotWillUseList);
    }

    @Override
    protected List<String> backgroundColors() {
        return Arrays.asList("limegreen", "dodgerblue", "gray");
    }

    @Override
    protected List<String> labels() {
        return Arrays.asList("Not used and will use",
                             "Used",
                             "Not used and won't use");
    }

    @Override
    protected List<String> crudTitleTexts() {
        return Arrays.asList("Recommendations that you should apply to your course.",
                             "Recommendations that you already use in your course.",
                             "Recommendations that you won't use in your course.");
    }
}