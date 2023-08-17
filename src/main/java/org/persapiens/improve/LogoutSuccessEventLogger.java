package org.persapiens.improve;

import org.persapiens.improve.domain.ViewLogType;
import org.springframework.security.authentication.event.LogoutSuccessEvent;

public class LogoutSuccessEventLogger extends AbstractAuthenticationEventLogger<LogoutSuccessEvent> {

    @Override
    protected ViewLogType viewLogType() {
        return ViewLogType.LOGOUT;
    }

}
