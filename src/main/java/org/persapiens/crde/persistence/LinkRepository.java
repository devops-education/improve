package org.persapiens.crde.persistence;

import org.persapiens.crde.domain.Link;
import org.persapiens.crde.domain.LinkId;

import org.springframework.data.repository.CrudRepository;

public interface LinkRepository extends CrudRepository<Link, LinkId> {
}
