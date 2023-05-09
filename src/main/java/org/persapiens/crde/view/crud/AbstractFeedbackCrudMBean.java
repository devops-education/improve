package org.persapiens.crde.view.crud;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.faces.view.ViewScoped;
import java.util.Locale;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.persapiens.crde.domain.ChallengeFeedback;
import org.persapiens.crde.domain.RecommendationFeedback;
import org.persapiens.crde.persistence.ChallengeFeedbackRepository;

import org.persapiens.crde.persistence.LinkRepository;
import org.persapiens.crde.persistence.RecommendationFeedbackRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
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

    @Getter
    @Setter
    private ChallengeFeedback selectedChallengeFeedback;

    @Getter
    @Setter
    private RecommendationFeedback selectedRecommendationFeedback;
    
    @Override
    public boolean isCheckStartInsert(T bean) {
        return false;
    }

    @Override
    public boolean isCheckStartUpdate(T bean) {
        return false;
    }
 
    protected String username() {
        return SecurityContextHolder.getContext().getAuthentication().getName();
    }

    public abstract boolean globalFilterFunction(Object value, Object filter, Locale locale);
 
    public void onSelectRecommendationFeedback(RecommendationFeedback recommendationFeedback) {
        recommendationFeedbackRepository.save(recommendationFeedback);
        setSelectedRecommendationFeedback(recommendationFeedback);
    }
    
    public void oncancelRecommendationFeedback(RecommendationFeedback recommendationFeedback) {
        if (recommendationFeedback.getId() != null) {
            recommendationFeedbackRepository.delete(recommendationFeedback);
        }
        recommendationFeedback.setKnown(null);
        recommendationFeedback.setId(null);
    }

    public void selectRecommendationFeedbackCommentListener() {
        recommendationFeedbackRepository.save(getSelectedRecommendationFeedback());
    }

    public void onSelectChallengeFeedback(ChallengeFeedback challengeFeedback) {
        challengeFeedbackRepository.save(challengeFeedback);
        setSelectedChallengeFeedback(challengeFeedback);
    }
    
    public void oncancelChallengeFeedback(ChallengeFeedback challengeFeedback) {
        if (challengeFeedback.getId() != null) {
            challengeFeedbackRepository.delete(challengeFeedback);
        }
        challengeFeedback.setKnown(null);
        challengeFeedback.setId(null);
    }

    public void selectChallengeFeedbackCommentListener() {
        challengeFeedbackRepository.save(getSelectedChallengeFeedback());
    }
    
    public abstract void commentListener();
}
