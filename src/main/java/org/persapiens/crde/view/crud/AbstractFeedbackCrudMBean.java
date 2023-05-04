package org.persapiens.crde.view.crud;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.faces.view.ViewScoped;
import java.util.Locale;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.persapiens.crde.domain.ChallengeFeedback;
import org.persapiens.crde.domain.LinkFeedback;
import org.persapiens.crde.domain.RecommendationFeedback;
import org.persapiens.crde.persistence.ChallengeFeedbackRepository;

import org.persapiens.crde.persistence.LinkFeedbackRepository;
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
    protected LinkFeedbackRepository linkFeedbackRepository;
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    protected ChallengeFeedbackRepository challengeFeedbackRepository;
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    protected RecommendationFeedbackRepository recommendationFeedbackRepository;

    @Getter
    @Setter
    private ChallengeFeedback ratedChallengeFeedback;

    @Getter
    @Setter
    private RecommendationFeedback ratedRecommendationFeedback;

    @Getter
    @Setter
    private LinkFeedback ratedLinkFeedback;
    
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

    public void onrateLinkFeedback(LinkFeedback linkFeedback) {
        linkFeedbackRepository.save(linkFeedback);
        setRatedLinkFeedback(linkFeedback);
        String message = "You rated the Link " + linkFeedback.getRating().getDescription() + "!";
        addInfoMessage(null, message, message);
    }
    
    public void oncancelLinkFeedback(LinkFeedback linkFeedback) {
        if (linkFeedback.getId() != null) {
            linkFeedbackRepository.delete(linkFeedback);
        }
        linkFeedback.setRating(null);
        linkFeedback.setId(null);
        String message = "You unrated the Link!";
        addInfoMessage(null, message, message);        
    }
 
    public void ratedLinkFeedbackJustificationListener() {
        linkFeedbackRepository.save(getRatedLinkFeedback());
    }

    public void onrateRecommendationFeedback(RecommendationFeedback recommendationFeedback) {
        recommendationFeedbackRepository.save(recommendationFeedback);
        setRatedRecommendationFeedback(recommendationFeedback);
        String message = "You rated the Recommendation " + recommendationFeedback.getRating().getDescription() + "!";
        addInfoMessage(null, message, message);
    }
    
    public void oncancelRecommendationFeedback(RecommendationFeedback recommendationFeedback) {
        if (recommendationFeedback.getId() != null) {
            recommendationFeedbackRepository.delete(recommendationFeedback);
        }
        recommendationFeedback.setRating(null);
        recommendationFeedback.setId(null);
        String message = "You unrated the Recommendation!";
        addInfoMessage(null, message, message);        
    }

    public void ratedRecommendationFeedbackJustificationListener() {
        recommendationFeedbackRepository.save(getRatedRecommendationFeedback());
    }

    public void onrateChallengeFeedback(ChallengeFeedback challengeFeedback) {
        challengeFeedbackRepository.save(challengeFeedback);
        setRatedChallengeFeedback(challengeFeedback);
        String message = "You rated the Challenge " + challengeFeedback.getRating().getDescription() + "!";
        addInfoMessage(null, message, message);
    }
    
    public void oncancelChallengeFeedback(ChallengeFeedback challengeFeedback) {
        if (challengeFeedback.getId() != null) {
            challengeFeedbackRepository.delete(challengeFeedback);
        }
        challengeFeedback.setRating(null);
        challengeFeedback.setId(null);
        String message = "You unrated the Challenge!";
        addInfoMessage(null, message, message);        
    }

    public void ratedChallengeFeedbackJustificationListener() {
        challengeFeedbackRepository.save(getRatedChallengeFeedback());
    }
    
    public abstract void justificationListener();
}
