package org.persapiens.crde.persistence;

import java.util.Collection;
import java.util.List;
import org.persapiens.crde.domain.Challenge;
import org.persapiens.crde.domain.ChallengeFeedback;

import org.springframework.data.repository.CrudRepository;

public interface ChallengeFeedbackRepository extends CrudRepository<ChallengeFeedback, Long> {
    List<ChallengeFeedback> findByUsername(String username);
    
    List<ChallengeFeedback> findByChallengeInAndUsername(Collection<Challenge> challenge, String username);
}
