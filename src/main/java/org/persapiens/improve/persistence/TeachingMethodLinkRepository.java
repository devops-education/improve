package org.persapiens.improve.persistence;

import org.persapiens.improve.domain.TeachingMethodLink;
import org.persapiens.improve.domain.TeachingMethodLinkId;

import org.springframework.data.repository.CrudRepository;

public interface TeachingMethodLinkRepository extends CrudRepository<TeachingMethodLink, TeachingMethodLinkId> {

}
