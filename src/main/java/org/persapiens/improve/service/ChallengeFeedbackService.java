package org.persapiens.improve.service;

import java.util.Collection;
import java.util.List;
import lombok.Getter;
import org.persapiens.improve.domain.Challenge;
import org.persapiens.improve.domain.ChallengeFeedback;
import org.persapiens.improve.persistence.ChallengeFeedbackRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChallengeFeedbackService extends RepositoryCrudService <ChallengeFeedback, Long> {

    @Getter
    @Autowired
    private ChallengeFeedbackRepository repository;
    
    @Autowired
    private ChallengeService challengeService;
    
    private List<ChallengeFeedback> fill(List<ChallengeFeedback> result) {
        for (ChallengeFeedback bean : result) {
            bean.setChallenge(challengeService.findById(bean.getChallenge().getId()).get());
        }
        
        return result;
    }
    
    public List<ChallengeFeedback> findByUsername(String username) {
        return fill(repository.findByUsername(username));
    }
    
    public List<ChallengeFeedback> findByChallengeInAndUsername(Collection<Challenge> challenge, String username) {
        return fill(repository.findByChallengeInAndUsername(challenge, username));
    }
    
}
