package org.persapiens.improve.persistence;

import java.util.List;
import java.util.Optional;
import org.persapiens.improve.domain.ChallengeFeedback;

public interface ChallengeFeedbackRepositoryCustom {
    List<ChallengeFeedback> findByUsernameLeftJoinChallengeLinks(String username);
    Optional<ChallengeFeedback> findDetailById(Long id);
}
