package org.persapiens.crde.view.crud;

import jakarta.faces.view.ViewScoped;

import org.persapiens.crde.domain.RecommendationTag;
import org.persapiens.crde.domain.Tag;
import org.springframework.stereotype.Component;

@ViewScoped
@Component
public class RecommendationTagCrudMBean extends CrudMBean<RecommendationTag, Long> {

	private static final long serialVersionUID = 1L;

	@Override
	protected RecommendationTag createBean() {
		return RecommendationTag.builder()
			.tag(Tag.builder().build())
			.build();
	}

}
