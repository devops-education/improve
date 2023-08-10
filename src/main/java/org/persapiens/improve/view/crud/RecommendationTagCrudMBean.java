package org.persapiens.improve.view.crud;

import jakarta.faces.view.ViewScoped;

import org.persapiens.improve.domain.RecommendationTag;
import org.persapiens.improve.domain.RecommendationTagId;
import org.persapiens.improve.domain.Tag;
import org.springframework.stereotype.Component;

@ViewScoped
@Component
public class RecommendationTagCrudMBean extends CrudMBean<RecommendationTag, RecommendationTagId> {

	private static final long serialVersionUID = 1L;

	@Override
	protected RecommendationTag createBean() {
		return RecommendationTag.builder()
			.tag(Tag.builder().build())
			.build();
	}

}
