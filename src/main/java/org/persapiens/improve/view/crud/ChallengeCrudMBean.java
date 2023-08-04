package org.persapiens.improve.view.crud;

import jakarta.faces.view.ViewScoped;

import org.persapiens.improve.domain.Challenge;
import org.springframework.stereotype.Component;

@ViewScoped
@Component
public class ChallengeCrudMBean extends CrudMBean<Challenge, Long> {

	private static final long serialVersionUID = 1L;

	@Override
	protected Challenge createBean() {
		return Challenge.builder().build();
	}

}