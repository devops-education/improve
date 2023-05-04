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
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.persapiens.crde.domain.Challenge;
import org.persapiens.crde.domain.ChallengeFeedback;
import org.persapiens.crde.domain.Link;
import org.persapiens.crde.domain.LinkFeedback;

import org.persapiens.crde.domain.Recommendation;
import org.persapiens.crde.domain.RecommendationFeedback;
import org.persapiens.crde.persistence.RecommendationRepository;
import org.primefaces.PrimeFaces;
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
    
    @Getter
    @Setter
    private List<LinkChallengeFeedback> linkChallengeFeedbackList;
    
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
        
        List<LinkChallengeFeedback> newLinkChallengeFeedbackList = new ArrayList<>();
        
        // recuperando os recommendation feedback dos links do desafio
        Map<Challenge, ChallengeFeedback> challengeChallengeFeedbackMap = challengeFeedbackRepository.findByChallengeInAndUsername(
            getBean().getRecommendation().getLinkSortedByChallengeAmountOfInterviewsList().stream().map(Link::getChallenge).collect(Collectors.toList()), username())
                .stream().collect(Collectors.toMap(ChallengeFeedback::getChallenge, Function.identity()));
        
        // varrendo os links do desafio
        for (Link link : getBean().getRecommendation().getLinkSortedByChallengeAmountOfInterviewsList()) {
            LinkFeedback linkFeedback = linkLinkFeedBackMap.get(link);
            if (linkFeedback == null) {
                linkFeedback = LinkFeedback.builder()
                    .link(link)
                    .username(username())
                    .build();
            }
            
            Challenge challenge = linkFeedback.getLink().getChallenge();
            ChallengeFeedback challengeFeedback = challengeChallengeFeedbackMap.get(challenge);
            if (challengeFeedback == null) {
                challengeFeedback = ChallengeFeedback.builder()
                    .challenge(challenge)
                    .username(username())
                    .build();
            }
            
            newLinkChallengeFeedbackList.add(LinkChallengeFeedback.builder()
                    .linkFeedback(linkFeedback)
                    .challengeFeedback(challengeFeedback)
                    .build());                    
        }
        
        setLinkChallengeFeedbackList(newLinkChallengeFeedbackList);
    }    

    @Override
    public void justificationListener() {
        recommendationFeedbackRepository.save(getBean());
    }

    @Override
    public void onrateLinkFeedback(LinkFeedback linkFeedback) {
        super.onrateLinkFeedback(linkFeedback); 
        
        PrimeFaces.current().executeScript("PF('linkRatingJustification').show()");
    }

    @Override
    public void onrateChallengeFeedback(ChallengeFeedback challengeFeedback) {
        super.onrateChallengeFeedback(challengeFeedback);
        
        PrimeFaces.current().executeScript("PF('challengeRatingJustification').show()");
    }
    
    
}
