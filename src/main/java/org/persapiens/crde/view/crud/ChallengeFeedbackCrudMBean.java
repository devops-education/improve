package org.persapiens.crde.view.crud;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.faces.view.ViewScoped;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;
import lombok.extern.slf4j.Slf4j;
import org.persapiens.crde.domain.Challenge;
import org.persapiens.crde.domain.ChallengeFeedback;
import org.persapiens.crde.domain.Link;

import org.persapiens.crde.domain.Recommendation;
import org.persapiens.crde.persistence.ChallengeFeedbackRepository;
import org.persapiens.crde.persistence.ChallengeRepository;
import org.persapiens.crde.persistence.LinkRepository;
import org.primefaces.util.LangUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@ViewScoped
@Component
public class ChallengeFeedbackCrudMBean extends CrudMBean<ChallengeFeedback, Long> {

    private static final long serialVersionUID = 1L;

    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private ChallengeRepository challengeRepository;
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private ChallengeFeedbackRepository challengeFeedbackRepository;
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private LinkRepository linkRepository;
    
    @Override
    protected ChallengeFeedback createBean() {
        return ChallengeFeedback.builder().build();
    }

    @Override
    public boolean isCheckStartInsert(ChallengeFeedback bean) {
        return false;
    }

    @Override
    public boolean isCheckStartUpdate(ChallengeFeedback bean) {
        return false;
    }

    @Override
    public List<ChallengeFeedback> find() {
        // create challengeFeedback map
        Map<Challenge, ChallengeFeedback> challengeFeedbackMap = new HashMap<>();
        for(ChallengeFeedback challengeFeedback : challengeFeedbackRepository.findByUsername(username())) {
            challengeFeedbackMap.put(challengeFeedback.getChallenge(), challengeFeedback);
        }

        Iterable<Link> iterable = linkRepository.findAll();
        
        Map<Recommendation, List<Link>> recommendationLinkMap = StreamSupport.stream(iterable.spliterator(), false).collect(Collectors.groupingBy(Link::getRecommendation));
        Map<Challenge, List<Link>> challengeLinkMap = StreamSupport.stream(iterable.spliterator(), false).collect(Collectors.groupingBy(Link::getChallenge));
        
        // create all challengeFeedback from challenge and previous feedback
        List<ChallengeFeedback> result = new ArrayList<>();
        for(Challenge challenge : challengeRepository.findByOrderByAmountOfInterviewsDesc()) {
            ChallengeFeedback challengeFeedback = challengeFeedbackMap.get(challenge);
            if (challengeFeedback == null) {
                challengeFeedback = ChallengeFeedback.builder()
                        .challenge(challenge)
                        .username(username())
                        .build();
            } else {
                log.debug("ChallengeFeedback " + challengeFeedback.getRating());
            }
            
            Set<Link> links = new HashSet<>();
            if (challengeLinkMap.containsKey(challenge)) {
                links.addAll(challengeLinkMap.get(challenge));
            }
            
            challengeFeedback.getChallenge().setLinks(links);
            for(Link link : links) {
                Recommendation recommendation = link.getRecommendation();
                Set<Link> recommendationLinks = new HashSet<>();
                if (recommendationLinkMap.containsKey(recommendation)) {
                    recommendationLinks.addAll(recommendationLinkMap.get(recommendation));
                }
                recommendation.setLinks(recommendationLinks);
            }
            result.add(challengeFeedback);
        }

        return result;
    }
 
    private String username() {
        return "marcelo";
    }

    public void onrate(ChallengeFeedback challengeFeedback) {
        challengeFeedbackRepository.save(challengeFeedback);
        String message = "You rated " + challengeFeedback.getRating().getDescription();
        addInfoMessage(null, message, message);
    }
    
    public void oncancel(ChallengeFeedback challengeFeedback) {
        if (challengeFeedback.getId() != null) {
            challengeFeedbackRepository.delete(challengeFeedback);
        }
        challengeFeedback.setRating(null);
        challengeFeedback.setId(null);
        String message = "You cancelled!";
        addInfoMessage(null, message, message);        
    }

    public boolean globalFilterFunction(Object value, Object filter, Locale locale) {
        String filterText = (filter == null) ? null : filter.toString().trim().toLowerCase();
        if (LangUtils.isBlank(filterText)) {
            return true;
        }

        Challenge challenge = ((ChallengeFeedback) value).getChallenge();
        return challenge.getMainIdea().toLowerCase().contains(filterText)
                || challenge.getAbstracts().toLowerCase().contains(filterText)
                || challenge.getInterviewQuotes().toLowerCase().contains(filterText)
                || challenge.getTags().toLowerCase().contains(filterText);
    }
    
}
