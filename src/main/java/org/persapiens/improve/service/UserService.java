package org.persapiens.improve.service;

import java.util.Optional;
import lombok.Getter;
import org.persapiens.improve.domain.Authority;
import org.persapiens.improve.domain.User;
import org.persapiens.improve.persistence.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Service;

@Service
public class UserService extends InMemoryCrudService <User, Long> {
    @Getter
    @Autowired
    private UserRepository repository;

    @Autowired
    private AuthorityService authorityService;
    
    @Autowired
    private UserDetailsManager userDetailsManager;

    @Override
    public void init() {
        super.init();
        
        for (User user: getBeans().values()) {        
            userDetailsManager.createUser(user.userDetails());            
        }
    }
    
    @Override
    protected User fill(User result) {
        result = super.fill(result); 
        
        result = fillAuthorities(result);
        
        return result;
    }

    private User fillAuthorities(User result) {
        result.setAuthorities(authorityService.findByUser(result));
        for (Authority authority: result.getAuthorities()) {
            authority.setUser(result);
        }
        return result;
    }

    public Optional<User> findByUsername(String username) {
        Optional<User> result = Optional.empty();
        for (User user: getBeans().values()) {
            if (user.getUsername().equals(username)) {
                result = Optional.of(user);
                break;
            }
        }
        return result;
    }
    
    @Override
    public void save(User bean) {
        boolean insert = bean.getId() == null;
        
        super.save(bean);
        
        if (insert) {
            userDetailsManager.createUser(bean.userDetails());
        } else {
            userDetailsManager.updateUser(bean.userDetails());
        }
    }
    
}
