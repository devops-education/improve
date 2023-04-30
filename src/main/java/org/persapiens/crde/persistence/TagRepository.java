package org.persapiens.crde.persistence;

import org.persapiens.crde.domain.Tag;

import org.springframework.data.repository.CrudRepository;

public interface TagRepository extends CrudRepository<Tag, Long> {

    Tag findByDescricao(String descricao);

    long countByDescricaoContains(String descricao);

}
