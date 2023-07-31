package org.persapiens.crde.view.crud;

import jakarta.faces.view.ViewScoped;

import org.persapiens.crde.domain.ChallengeTag;
import org.springframework.stereotype.Component;

@ViewScoped
@Component
public class ChallengeTagCrudMBean extends CrudMBean<ChallengeTag, Long> {

	private static final long serialVersionUID = 1L;

	@Override
	protected ChallengeTag createBean() {
		return ChallengeTag.builder().build();
	}

}
