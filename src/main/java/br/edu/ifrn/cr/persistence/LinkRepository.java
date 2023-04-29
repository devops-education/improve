package br.edu.ifrn.cr.persistence;

import br.edu.ifrn.cr.domain.Link;
import br.edu.ifrn.cr.domain.LinkId;

import org.springframework.data.repository.CrudRepository;

public interface LinkRepository extends CrudRepository<Link, LinkId> {
}
