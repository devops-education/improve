package org.persapiens.improve.persistence;

import java.util.Collection;
import java.util.List;
import org.persapiens.improve.domain.Challenge;
import org.persapiens.improve.domain.ChallengeFeedback;
import org.persapiens.improve.domain.User;

import org.springframework.data.repository.CrudRepository;

public interface ChallengeFeedbackRepository extends CrudRepository<ChallengeFeedback, Long> {

	List<ChallengeFeedback> findByUser(User user);

	List<ChallengeFeedback> findByChallengeInAndUser(Collection<Challenge> challenge, User user);

}
