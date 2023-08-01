package org.persapiens.improve.view.crud;

import jakarta.faces.view.ViewScoped;

import org.persapiens.improve.domain.Tag;
import org.springframework.stereotype.Component;

@ViewScoped
@Component
public class TagCrudMBean extends CrudMBean<Tag, Long> {

	private static final long serialVersionUID = 1L;

	@Override
	protected Tag createBean() {
		return Tag.builder().build();
	}

}
