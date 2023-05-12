package org.persapiens.crde.persistence;

import java.util.List;
import org.persapiens.crde.domain.Challenge;
import org.persapiens.crde.domain.Link;
import org.persapiens.crde.domain.LinkId;

import org.springframework.data.repository.CrudRepository;

public interface LinkRepository extends CrudRepository<Link, LinkId> {    
    List<Link> findByChallenge(Challenge challenge);
}
