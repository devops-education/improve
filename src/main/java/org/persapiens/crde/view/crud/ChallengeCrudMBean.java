package org.persapiens.crde.view.crud;

import jakarta.faces.view.ViewScoped;
import jakarta.inject.Named;

import org.persapiens.crde.domain.Challenge;

@ViewScoped
@Named
public class ChallengeCrudMBean extends CrudMBean<Challenge, Long> {

	private static final long serialVersionUID = 1L;

	@Override
	protected Challenge createBean() {
		return Challenge.builder().build();
	}

}
