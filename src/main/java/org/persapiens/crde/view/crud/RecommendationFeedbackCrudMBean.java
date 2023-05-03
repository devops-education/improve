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
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;
import lombok.extern.slf4j.Slf4j;
import org.persapiens.crde.domain.Challenge;
import org.persapiens.crde.domain.Link;
import org.persapiens.crde.domain.LinkFeedback;

import org.persapiens.crde.domain.Recommendation;
import org.persapiens.crde.domain.RecommendationFeedback;
import org.persapiens.crde.persistence.RecommendationFeedbackRepository;
import org.persapiens.crde.persistence.RecommendationRepository;
import org.primefaces.util.LangUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@ViewScoped
@Component
public class RecommendationFeedbackCrudMBean extends AbstractFeedbackCrudMBean<RecommendationFeedback> {

    private static final long serialVersionUID = 1L;

    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private RecommendationRepository recommendationRepository;
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private RecommendationFeedbackRepository recommendationFeedbackRepository;
    
    @Override
    protected RecommendationFeedback createBean() {
        return RecommendationFeedback.builder().build();
    }

    @Override
    public List<RecommendationFeedback> find() {
        // create recommendationFeedback map
        Map<Recommendation, RecommendationFeedback> recommendationFeedbackMap = new HashMap<>();
        for(RecommendationFeedback recommendationFeedback : recommendationFeedbackRepository.findByUsername(username())) {
            recommendationFeedbackMap.put(recommendationFeedback.getRecommendation(), recommendationFeedback);
        }

        Iterable<Link> iterable = linkRepository.findAll();
        
        Map<Recommendation, List<Link>> recommendationLinkMap = StreamSupport.stream(iterable.spliterator(), false).collect(Collectors.groupingBy(Link::getRecommendation));
        Map<Challenge, List<Link>> challengeLinkMap = StreamSupport.stream(iterable.spliterator(), false).collect(Collectors.groupingBy(Link::getChallenge));
        
        // create all recommendationFeedback from recommendation and previous feedback
        List<RecommendationFeedback> result = new ArrayList<>();
        for(Recommendation recommendation : recommendationRepository.findByOrderByAmountOfInterviewsDesc()) {
            RecommendationFeedback recommendationFeedback = recommendationFeedbackMap.get(recommendation);
            if (recommendationFeedback == null) {
                recommendationFeedback = RecommendationFeedback.builder()
                        .recommendation(recommendation)
                        .username(username())
                        .build();
            } else {
                log.debug("RecommendationFeedback " + recommendationFeedback.getRating());
            }
            
            Set<Link> links = new HashSet<>();
            if (recommendationLinkMap.containsKey(recommendation)) {
                links.addAll(recommendationLinkMap.get(recommendation));
            }
            
            recommendationFeedback.getRecommendation().setLinks(links);
            for(Link link : links) {
                Challenge challenge = link.getChallenge();
                Set<Link> challengeLinks = new HashSet<>();
                if (challengeLinkMap.containsKey(challenge)) {
                    challengeLinks.addAll(challengeLinkMap.get(challenge));
                }
                challenge.setLinks(challengeLinks);
            }
            result.add(recommendationFeedback);
        }

        return result;
    }
 
    @Override
    public void onrate(RecommendationFeedback recommendationFeedback) {
        recommendationFeedbackRepository.save(recommendationFeedback);
        String message = "You rated the Recommendation " + recommendationFeedback.getRating().getDescription() + "!";
        addInfoMessage(null, message, message);
    }
    
    @Override
    public void oncancel(RecommendationFeedback recommendationFeedback) {
        if (recommendationFeedback.getId() != null) {
            recommendationFeedbackRepository.delete(recommendationFeedback);
        }
        recommendationFeedback.setRating(null);
        recommendationFeedback.setId(null);
        String message = "You unrated the Recommendation!";
        addInfoMessage(null, message, message);        
    }

    @Override
    public boolean globalFilterFunction(Object value, Object filter, Locale locale) {
        String filterText = (filter == null) ? null : filter.toString().trim().toLowerCase();
        if (LangUtils.isBlank(filterText)) {
            return true;
        }

        Recommendation recommendation = ((RecommendationFeedback) value).getRecommendation();
        return recommendation.getMainIdea().toLowerCase().contains(filterText)
                || recommendation.getAbstracts().toLowerCase().contains(filterText)
                || recommendation.getInterviewQuotes().toLowerCase().contains(filterText)
                || recommendation.getTags().toLowerCase().contains(filterText);
    }

    @Override
    public void startDetailAction() {
        super.startDetailAction(); 

        Map<Link, LinkFeedback> linkLinkFeedBackMap = linkFeedbackRepository.findByLinkInAndUsername(getBean().getRecommendation().getLinks(), username())
                .stream().collect(Collectors.toMap(LinkFeedback::getLink, Function.identity()));
        
        List<LinkFeedback> newLinkFeedbackList = new ArrayList<>();
        for (Link link : getBean().getRecommendation().getLinkSortedByChallengeAmountOfInterviewsList()) {
            LinkFeedback linkFeedback = linkLinkFeedBackMap.get(link);
            if (linkFeedback == null) {
                linkFeedback = LinkFeedback.builder()
                    .link(link)
                    .username(username())
                    .build();
            }
            newLinkFeedbackList.add(linkFeedback);                    
        }
        setLinkFeedbackList(newLinkFeedbackList);
    }    

    public void justificationListener() {
        recommendationFeedbackRepository.save(getBean());
    }
    
}