package org.persapiens.crde.persistence;

import java.util.List;
import org.persapiens.crde.domain.Challenge;

public interface ChallengeRepositoryCustom {
    List<Challenge> findByOrderByChallengeInterviewsSizeDesc();
}
