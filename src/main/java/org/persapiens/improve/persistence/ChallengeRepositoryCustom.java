package org.persapiens.improve.persistence;

import java.util.List;
import org.persapiens.improve.domain.Challenge;

public interface ChallengeRepositoryCustom {
    List<Challenge> findByOrderByChallengeInterviewsSizeDesc();
}
