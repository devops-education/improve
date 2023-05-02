package org.persapiens.crde.persistence;

import org.persapiens.crde.domain.Challenge;

import org.springframework.data.repository.CrudRepository;

public interface ChallengeRepository extends CrudRepository<Challenge, Long> {
}
