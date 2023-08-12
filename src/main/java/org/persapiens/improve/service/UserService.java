package org.persapiens.improve.service;

import java.util.Optional;
import lombok.Getter;
import org.persapiens.improve.domain.User;
import org.persapiens.improve.persistence.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService extends InMemoryCrudService <User, Long> {
    @Getter
    @Autowired
    private UserRepository repository;

    public Optional<User> findByUsername(String username) {
        return repository.findByUsername(username);
    }
    
}
