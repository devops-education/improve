package org.persapiens.improve.persistence;

import org.persapiens.improve.domain.Tag;

import org.springframework.data.repository.CrudRepository;

public interface TagRepository extends CrudRepository<Tag, Long> {
}
