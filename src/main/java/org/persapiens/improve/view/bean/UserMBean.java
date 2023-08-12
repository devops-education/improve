package org.persapiens.improve.view.bean;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.faces.bean.SessionScoped;

import org.persapiens.improve.domain.User;
import org.persapiens.improve.service.UserService;
import org.persapiens.improve.view.AbstractMBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@SessionScoped
@Component
public class UserMBean extends AbstractMBean {

	private static final long serialVersionUID = 1L;

	private User loggedUser;
	
        @SuppressFBWarnings("SE_BAD_FIELD")
        @Autowired
        private UserService userService;
        
        @SuppressFBWarnings("EI_EXPOSE_REP")
        public User getLoggedUser() {
		if (loggedUser == null) {
                    loggedUser = userService.findByUsername(username()).get();
                }
                return loggedUser;
	}

}
