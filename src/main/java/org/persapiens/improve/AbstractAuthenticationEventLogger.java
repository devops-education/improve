package org.persapiens.improve;

import org.persapiens.improve.domain.ViewLog;
import org.persapiens.improve.domain.ViewLogType;
import org.persapiens.improve.service.UserService;
import org.persapiens.improve.service.ViewLogService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.AbstractAuthenticationEvent;

public abstract class AbstractAuthenticationEventLogger<T extends AbstractAuthenticationEvent>
		implements ApplicationListener<T> {

	@Autowired
	private ViewLogService viewLogService;

	@Autowired
	private UserService userService;

	protected abstract ViewLogType viewLogType();

	@Override
	public void onApplicationEvent(final T event) {
		event.getAuthentication().getName();
		viewLogService.save(ViewLog.builder()
			.type(viewLogType())
			.user(userService.findByUsername(event.getAuthentication().getName()).get())
			.description("")
			.build());
	}

}
