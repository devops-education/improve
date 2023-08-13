package org.persapiens.improve.service;

import java.util.Set;
import java.util.stream.Collectors;
import lombok.Getter;
import org.persapiens.improve.domain.Authority;
import org.persapiens.improve.domain.User;
import org.persapiens.improve.persistence.AuthorityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthorityService extends InMemoryCrudService <Authority, Long> {
    @Getter
    @Autowired
    private AuthorityRepository repository;

    public Set<Authority> findByUser(User user) {
        return getBeans().values().stream().filter( t -> t.getUser().equals(user))
            .collect(Collectors.toSet());
    }
}
