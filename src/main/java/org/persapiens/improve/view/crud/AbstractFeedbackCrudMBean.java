package org.persapiens.improve.view.crud;

import jakarta.faces.view.ViewScoped;
import java.io.IOException;
import java.util.Locale;
import lombok.extern.slf4j.Slf4j;
import org.apache.lucene.queryparser.classic.ParseException;
import org.persapiens.improve.domain.ChallengeFeedback;
import org.persapiens.improve.domain.IdBean;
import org.persapiens.improve.domain.RecommendationFeedback;
import org.persapiens.improve.service.RecommendationFeedbackService;
import org.persapiens.improve.service.ChallengeFeedbackService;
import org.primefaces.util.LangUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@ViewScoped
@Component
public abstract class AbstractFeedbackCrudMBean<T extends IdBean<Long>> extends CrudMBean<T, Long> {

    private static final long serialVersionUID = 1L;
    
    @Autowired
    protected ChallengeFeedbackService challengeFeedbackService;
    
    @Autowired
    protected RecommendationFeedbackService recommendationFeedbackService;

    @Override
    public boolean isCheckStartUpdate(T bean) {
        return true;
    }

    public boolean globalFilterFunction(T value, Object filter, Locale locale) {
        boolean result = false;
        try {
            String filterText = (filter == null) ? null : filter.toString().trim().toLowerCase();
            if (LangUtils.isBlank(filterText)) {
                return true;
            } else {
                result = doGlobalFilterFunction(value, filterText, locale);
            }
        } catch (ParseException | IOException ex) {
            result = false;
        }
        return result;
    }

    protected abstract boolean doGlobalFilterFunction(T value, String filter, Locale locale) throws ParseException, IOException;
    
    public void saveRecommendationFeedbackKnown(RecommendationFeedback recommendationFeedback) {
        saveRecommendationFeedback(recommendationFeedback);
    }
 
    public void saveRecommendationFeedbackUsedAlready(RecommendationFeedback recommendationFeedback) {
        saveRecommendationFeedback(recommendationFeedback);
    }
 
    public void saveRecommendationFeedbackWillUse(RecommendationFeedback recommendationFeedback) {
        saveRecommendationFeedback(recommendationFeedback);
    }

    public void saveRecommendationFeedback(RecommendationFeedback recommendationFeedback) {
        recommendationFeedbackService.save(recommendationFeedback);
    }
 
    public void saveChallengeFeedback(ChallengeFeedback challengeFeedback) {
        challengeFeedbackService.save(challengeFeedback);
    }

    public void saveChallengeFeedbackKnown(ChallengeFeedback challengeFeedback) {
        saveChallengeFeedback(challengeFeedback);
    }

    public void saveChallengeFeedbackWillMitigate(ChallengeFeedback challengeFeedback) {
        saveChallengeFeedback(challengeFeedback);
    }
}
