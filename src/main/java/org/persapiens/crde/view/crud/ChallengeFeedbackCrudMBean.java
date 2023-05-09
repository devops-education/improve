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

import org.persapiens.crde.domain.Recommendation;
import org.persapiens.crde.domain.RecommendationFeedback;
import org.persapiens.crde.persistence.ChallengeRepository;
import org.primefaces.PrimeFaces;
import org.primefaces.util.LangUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@ViewScoped
@Component
public class ChallengeFeedbackCrudMBean extends AbstractFeedbackCrudMBean<ChallengeFeedback> {

    private static final long serialVersionUID = 1L;

    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private ChallengeRepository challengeRepository;
    
    @Getter
    @Setter
    private List<LinkRecommendationFeedback> linkRecommendationFeedbackList;
    
    @Override
    protected ChallengeFeedback createBean() {
        return ChallengeFeedback.builder().build();
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
                log.debug("ChallengeFeedback " + challengeFeedback.getKnown());
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

    @Override
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

    @Override
    public void startDetailAction() {
        super.startDetailAction(); 

        // recuperando os links feedback dos links do desafios do challenge feedback desse usuario
        Map<Link, LinkFeedback> linkLinkFeedBackMap = linkFeedbackRepository.findByLinkInAndUsername(getBean().getChallenge().getLinks(), username())
                .stream().collect(Collectors.toMap(LinkFeedback::getLink, Function.identity()));
        
        List<LinkRecommendationFeedback> newLinkRecommendationFeedbackList = new ArrayList<>();
        
        // recuperando os recommendation feedback dos links do desafio
        Map<Recommendation, RecommendationFeedback> recommendationRecommendationFeedbackMap = recommendationFeedbackRepository.findByRecommendationInAndUsername(
getBean().getChallenge().getLinkSortedByRecommendationAmountOfInterviewsList().stream().map(Link::getRecommendation).collect(Collectors.toList()), username())
                .stream().collect(Collectors.toMap(RecommendationFeedback::getRecommendation, Function.identity()));
        
        // varrendo os links do desafio
        for (Link link : getBean().getChallenge().getLinkSortedByRecommendationAmountOfInterviewsList()) {
            LinkFeedback linkFeedback = linkLinkFeedBackMap.get(link);
            if (linkFeedback == null) {
                linkFeedback = LinkFeedback.builder()
                    .link(link)
                    .username(username())
                    .build();
            }
            
            Recommendation recommendation = linkFeedback.getLink().getRecommendation();
            RecommendationFeedback recommendationFeedback = recommendationRecommendationFeedbackMap.get(recommendation);
            if (recommendationFeedback == null) {
                recommendationFeedback = RecommendationFeedback.builder()
                    .recommendation(recommendation)
                    .username(username())
                    .build();
            }

            newLinkRecommendationFeedbackList.add(LinkRecommendationFeedback.builder()
                    .linkFeedback(linkFeedback)
                    .recommendationFeedback(recommendationFeedback)
                    .build());                    
        }
        setLinkRecommendationFeedbackList(newLinkRecommendationFeedbackList);
    }    

    @Override
    public void justificationListener() {
        challengeFeedbackRepository.save(getBean());
    }

    @Override
    public void onrateRecommendationFeedback(RecommendationFeedback recommendationFeedback) {
        super.onrateRecommendationFeedback(recommendationFeedback);
        
        PrimeFaces.current().executeScript("PF('recommendationRatingJustification"+recommendationFeedback.getRecommendation().getId()+"').show()");
    }
    
}
