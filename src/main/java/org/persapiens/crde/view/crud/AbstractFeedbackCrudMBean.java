package org.persapiens.crde.view.crud;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.faces.view.ViewScoped;
import java.util.List;
import java.util.Locale;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.persapiens.crde.domain.LinkFeedback;

import org.persapiens.crde.persistence.LinkFeedbackRepository;
import org.persapiens.crde.persistence.LinkRepository;
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
    
    @Getter
    @Setter
    private List<LinkFeedback> linkFeedbackList;

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

    public abstract void onrate(T recommendationFeedback);
    
    public abstract void oncancel(T recommendationFeedback);

    public abstract boolean globalFilterFunction(Object value, Object filter, Locale locale);

    public void onrateLinkFeedback(LinkFeedback linkFeedback) {
        linkFeedbackRepository.save(linkFeedback);
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
    
}
