package org.persapiens.crde.persistence;

import java.util.Collection;
import java.util.List;
import org.persapiens.crde.domain.Link;
import org.persapiens.crde.domain.LinkFeedback;

import org.springframework.data.repository.CrudRepository;

public interface LinkFeedbackRepository extends CrudRepository<LinkFeedback, Long> {
    List<LinkFeedback> findByLinkInAndUsername(Collection<Link> links, String username);
}
