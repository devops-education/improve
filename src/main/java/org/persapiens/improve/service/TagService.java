package org.persapiens.improve.service;

import lombok.Getter;
import org.persapiens.improve.domain.Tag;
import org.persapiens.improve.persistence.TagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TagService extends InMemoryCrudService <Tag, Long> {
    @Getter
    @Autowired
    private TagRepository repository;

}
