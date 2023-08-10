package org.persapiens.improve.view.crud;

import jakarta.faces.view.ViewScoped;

import org.persapiens.improve.domain.ChallengeTag;
import org.persapiens.improve.domain.ChallengeTagId;
import org.springframework.stereotype.Component;

@ViewScoped
@Component
public class ChallengeTagCrudMBean extends CrudMBean<ChallengeTag, ChallengeTagId> {

	private static final long serialVersionUID = 1L;

	@Override
	protected ChallengeTag createBean() {
		return ChallengeTag.builder().build();
	}

}
