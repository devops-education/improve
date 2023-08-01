package org.persapiens.improve.persistence;

import java.util.Optional;
import org.persapiens.improve.domain.ChallengeFeedback;

public interface ChallengeFeedbackRepositoryCustom {
    Optional<ChallengeFeedback> findDetailById(Long id);
}
