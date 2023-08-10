package org.persapiens.improve.persistence;

import org.persapiens.improve.domain.Interview;

import org.springframework.data.repository.CrudRepository;

public interface InterviewRepository extends CrudRepository<Interview, Long> {
}
