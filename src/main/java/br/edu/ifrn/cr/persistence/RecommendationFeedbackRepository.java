package br.edu.ifrn.cr.persistence;

import br.edu.ifrn.cr.domain.RecommendationFeedback;

import org.springframework.data.repository.CrudRepository;

public interface RecommendationFeedbackRepository extends CrudRepository<RecommendationFeedback, Long> {
}
