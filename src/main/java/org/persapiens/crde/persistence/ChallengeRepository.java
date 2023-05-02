package org.persapiens.crde.persistence;

import java.util.List;
import org.persapiens.crde.domain.Challenge;

import org.springframework.data.repository.CrudRepository;

public interface ChallengeRepository extends CrudRepository<Challenge, Long> {
    List<Challenge> findByOrderByAmountOfInterviewsDesc();
}
