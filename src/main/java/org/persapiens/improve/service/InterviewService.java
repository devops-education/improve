package org.persapiens.improve.service;

import lombok.Getter;
import org.persapiens.improve.domain.Interview;
import org.persapiens.improve.persistence.InterviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InterviewService extends InMemoryCrudService <Interview, Long> {
    @Getter
    @Autowired
    private InterviewRepository repository;
}
