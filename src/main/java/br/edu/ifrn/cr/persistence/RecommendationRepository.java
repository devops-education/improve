package br.edu.ifrn.cr.persistence;

import br.edu.ifrn.cr.domain.Recommendation;

import org.springframework.data.repository.CrudRepository;

public interface RecommendationRepository extends CrudRepository<Recommendation, Long> {

}
