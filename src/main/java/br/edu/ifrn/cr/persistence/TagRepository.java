package br.edu.ifrn.cr.persistence;

import br.edu.ifrn.cr.domain.Tag;

import org.springframework.data.repository.CrudRepository;

public interface TagRepository extends CrudRepository<Tag, Long> {

    Tag findByDescricao(String descricao);

    long countByDescricaoContains(String descricao);

}
