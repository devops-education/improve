package br.edu.ifrn.cr.persistence;

import br.edu.ifrn.cr.domain.Challenge;

import org.springframework.data.repository.CrudRepository;

public interface ChallengeRepository extends CrudRepository<Challenge, Long> {

}
