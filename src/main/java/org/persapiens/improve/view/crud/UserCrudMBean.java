package org.persapiens.improve.view.crud;

import jakarta.faces.view.ViewScoped;

import org.persapiens.improve.domain.User;
import org.springframework.stereotype.Component;

@ViewScoped
@Component
public class UserCrudMBean extends CrudMBean<User, Long> {

    private static final long serialVersionUID = 1L;

    @Override
    protected User createBean() {
        return User.builder().build();
    }

    @Override
    public boolean isCheckStartUpdate(User bean) {
        return true;
    }

    @Override
    public boolean isCheckStartInsert(User bean) {
        return true;
    }
    
}
