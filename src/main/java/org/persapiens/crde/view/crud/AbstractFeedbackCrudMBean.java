package org.persapiens.crde.view.crud;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.faces.view.ViewScoped;
import java.io.IOException;
import java.util.Locale;
import lombok.extern.slf4j.Slf4j;
import org.apache.lucene.queryparser.classic.ParseException;
import org.persapiens.crde.domain.ChallengeFeedback;
import org.persapiens.crde.domain.RecommendationFeedback;
import org.persapiens.crde.persistence.ChallengeFeedbackRepository;

import org.persapiens.crde.persistence.LinkRepository;
import org.persapiens.crde.persistence.RecommendationFeedbackRepository;
import org.primefaces.PrimeFaces;
import org.primefaces.util.LangUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@ViewScoped
@Component
public abstract class AbstractFeedbackCrudMBean<T extends Object> extends CrudMBean<T, Long> {

    private static final long serialVersionUID = 1L;
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    protected LinkRepository linkRepository;
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    protected ChallengeFeedbackRepository challengeFeedbackRepository;
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    protected RecommendationFeedbackRepository recommendationFeedbackRepository;

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
        recommendationFeedbackRepository.save(recommendationFeedback);
    }
 
    
    public void saveChallengeFeedback(ChallengeFeedback challengeFeedback) {
        challengeFeedbackRepository.save(challengeFeedback);
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
