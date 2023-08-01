package org.persapiens.improve.persistence;

import java.util.List;
import org.persapiens.improve.domain.Challenge;
import org.persapiens.improve.domain.Link;
import org.persapiens.improve.domain.LinkId;

import org.springframework.data.repository.CrudRepository;

public interface LinkRepository extends CrudRepository<Link, LinkId> {    
    List<Link> findByChallenge(Challenge challenge);
}
