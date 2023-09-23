package org.persapiens.improve;

import org.persapiens.improve.domain.ViewLogType;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;

public class AuthenticationSuccessEventLogger extends AbstractAuthenticationEventLogger<AuthenticationSuccessEvent> {

	@Override
	protected ViewLogType viewLogType() {
		return ViewLogType.LOGIN;
	}

}
