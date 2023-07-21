package org.persapiens.crde.persistence;

import java.util.Optional;
import org.persapiens.crde.domain.ChallengeFeedback;

public interface ChallengeFeedbackRepositoryCustom {
    Optional<ChallengeFeedback> findDetailById(Long id);
}
