package br.edu.ifrn.cr.persistence;

import br.edu.ifrn.cr.domain.LinkFeedback;

import org.springframework.data.repository.CrudRepository;

public interface LinkFeedbackRepository extends CrudRepository<LinkFeedback, Long> {
}
