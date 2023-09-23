package org.persapiens.improve.persistence;

import org.persapiens.improve.domain.Link;
import org.persapiens.improve.domain.LinkId;

import org.springframework.data.repository.CrudRepository;

public interface LinkRepository extends CrudRepository<Link, LinkId> {

}
