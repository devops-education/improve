package org.persapiens.improve.view.crud;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
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
import org.primefaces.PrimeFaces;
import org.primefaces.util.LangUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@ViewScoped
@Component
public abstract class AbstractFeedbackCrudMBean<T extends IdBean<Long>> extends CrudMBean<T, Long> {

    private static final long serialVersionUID = 1L;
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    protected ChallengeFeedbackService challengeFeedbackService;
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    protected RecommendationFeedbackService recommendationFeedbackService;

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
    
    public void saveRecommendationFeedbackKnownDialog(RecommendationFeedback recommendationFeedback) {
        saveRecommendationFeedbackDialog(recommendationFeedback, recommendationFeedback.getKnown() != null);
    }
 
    public void saveRecommendationFeedbackUsedAlreadyDialog(RecommendationFeedback recommendationFeedback) {
        saveRecommendationFeedbackDialog(recommendationFeedback, recommendationFeedback.getUsedAlready()!= null);
    }
 
    public void saveRecommendationFeedbackWillUseDialog(RecommendationFeedback recommendationFeedback) {
        saveRecommendationFeedbackDialog(recommendationFeedback, recommendationFeedback.getWillUse()!= null);
    }
 
    private void saveRecommendationFeedbackDialog(RecommendationFeedback recommendationFeedback, Boolean openDialog) {
        saveRecommendationFeedback(recommendationFeedback);
        
        if (openDialog) {
            PrimeFaces.current().executeScript("PF('recommendationDialog"+recommendationFeedback.getRecommendation().getId()+"').show()");
        }
    }

    public void saveRecommendationFeedback(RecommendationFeedback recommendationFeedback) {
        recommendationFeedbackService.save(recommendationFeedback);
    }
 
    public void saveChallengeFeedback(ChallengeFeedback challengeFeedback) {
        challengeFeedbackService.save(challengeFeedback);
    }
    
    private void saveChallengeFeedbackDialog(ChallengeFeedback challengeFeedback, Boolean openDialog) {
        saveChallengeFeedback(challengeFeedback);

        if (openDialog) {
            PrimeFaces.current().executeScript("PF('challengeDialog"+challengeFeedback.getChallenge().getId()+"').show()");
        }
    }

    public void saveChallengeFeedbackKnownDialog(ChallengeFeedback challengeFeedback) {
        saveChallengeFeedbackDialog(challengeFeedback, challengeFeedback.getKnown() != null);
    }

    public void saveChallengeFeedbackWillMitigateDialog(ChallengeFeedback challengeFeedback) {
        saveChallengeFeedbackDialog(challengeFeedback, challengeFeedback.getWillMitigate() != null);
    }
}
