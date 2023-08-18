package org.persapiens.improve.service;

import lombok.Getter;
import org.persapiens.improve.domain.TeachingMethodLink;
import org.persapiens.improve.domain.TeachingMethodLinkId;
import org.persapiens.improve.persistence.TeachingMethodLinkRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeachingMethodLinkService extends InMemoryCrudService <TeachingMethodLink, TeachingMethodLinkId> {
    @Getter
    @Autowired
    private TeachingMethodLinkRepository repository;

}
