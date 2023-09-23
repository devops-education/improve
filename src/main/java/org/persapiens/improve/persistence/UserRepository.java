package org.persapiens.improve.persistence;

import org.persapiens.improve.domain.User;

import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Long> {

}
