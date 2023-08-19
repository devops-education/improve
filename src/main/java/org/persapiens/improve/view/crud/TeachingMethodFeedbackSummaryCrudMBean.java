package org.persapiens.improve.view.crud;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.faces.view.ViewScoped;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import lombok.extern.slf4j.Slf4j;
import org.persapiens.improve.domain.TeachingMethod;
import org.persapiens.improve.domain.TeachingMethodFeedback;
import org.persapiens.improve.domain.TeachingMethodLink;
import org.persapiens.improve.service.TeachingMethodFeedbackService;
import org.persapiens.improve.service.TeachingMethodLinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@ViewScoped
@Component
public class TeachingMethodFeedbackSummaryCrudMBean extends AbstractFeedbackSummaryCrudMBean<TeachingMethodFeedback> {

    private static final long serialVersionUID = 1L;
    
    private Map<TeachingMethod, Set<TeachingMethodLink>> teachingMethodTeachingMethodLinkSetMap = new HashMap<>();
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private TeachingMethodFeedbackService teachingMethodFeedbackService;
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private TeachingMethodLinkService teachingMethodLinkService;

    @Override
    protected TeachingMethodFeedback createBean() {
        return TeachingMethodFeedback.builder().build();
    }

    @Override
    protected List<List<TeachingMethodFeedback>> feedbackLists() {
        List<TeachingMethodFeedback> notUsedAndWillUseList = new ArrayList<>();
        List<TeachingMethodFeedback> usedAlreadyList = new ArrayList<>();
        List<TeachingMethodFeedback> notUsedAndNotWillUseList = new ArrayList<>();
        
        for (TeachingMethodFeedback rf : teachingMethodFeedbackService.findByUser(userMBean.getLoggedUser())) {
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
        
        notUsedAndWillUseList = sortTeachingMethodFeedback(notUsedAndWillUseList);
        usedAlreadyList = sortTeachingMethodFeedback(usedAlreadyList);
        notUsedAndNotWillUseList = sortTeachingMethodFeedback(notUsedAndNotWillUseList);
        
        return Arrays.asList(notUsedAndWillUseList, usedAlreadyList, notUsedAndNotWillUseList);
    }

    protected List<TeachingMethodFeedback> sortTeachingMethodFeedback(List<TeachingMethodFeedback> list) {
        Comparator<TeachingMethodFeedback> comparator = (TeachingMethodFeedback o1, TeachingMethodFeedback o2) -> 
            o2.getTeachingMethod().getName().compareTo(o1.getTeachingMethod().getName());
        Collections.sort(list, comparator);
        
        return list;
    }

    @Override
    protected List<String> backgroundColors() {
        return Arrays.asList("limegreen", "dodgerblue", "grey");
    }

    @Override
    protected List<String> labels() {
        return Arrays.asList("Not used and will use",
                             "Used",
                             "Not used and won't use");
    }

    @Override
    protected List<String> crudTitleTexts() {
        return Arrays.asList("Teaching methods that you should apply to your course.",
                             "Teaching methods that you already use in your course.",
                             "Teaching methods that you won't use in your course.");
    }

    public Set<TeachingMethodLink> getTeachingMethodLinks(TeachingMethod teachingMethod) {
        Set<TeachingMethodLink> result = teachingMethodTeachingMethodLinkSetMap.get(teachingMethod);
            
        if (result == null) {
            result = TeachingMethodLink.getSetSortedByTeachingMethodAndInterviewSnippet();
            result.addAll(teachingMethodLinkService.findByTeachingMethod(teachingMethod));
            teachingMethodTeachingMethodLinkSetMap.put(teachingMethod, result);
        }
        
        return result;
    }
}
