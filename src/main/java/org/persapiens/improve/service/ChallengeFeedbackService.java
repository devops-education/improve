package org.persapiens.improve.service;

import java.util.Collection;
import java.util.List;
import lombok.Getter;
import org.persapiens.improve.domain.Challenge;
import org.persapiens.improve.domain.ChallengeFeedback;
import org.persapiens.improve.domain.User;
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
    
    @Autowired
    private UserService userService;
    
    private List<ChallengeFeedback> fill(List<ChallengeFeedback> result) {
        for (ChallengeFeedback bean : result) {
            bean.setChallenge(challengeService.findById(bean.getChallenge().getId()).get());
            bean.setUser(userService.findById(bean.getUser().getId()).get());
        }
        
        return result;
    }
    
    public List<ChallengeFeedback> findByUser(User user) {
        return fill(repository.findByUser(user));
    }
    
    public List<ChallengeFeedback> findByChallengeInAndUser(Collection<Challenge> challenge, User user) {
        return fill(repository.findByChallengeInAndUser(challenge, user));
    }

    @Override
    public void save(ChallengeFeedback bean) {
        if (bean.getId() == null) {
            bean.insert();
        } else {
            bean.update();
        }

        super.save(bean);
    }
    
}
