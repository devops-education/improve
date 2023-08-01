package org.persapiens.improve.view.crud;

import jakarta.faces.view.ViewScoped;

import org.persapiens.improve.domain.Link;
import org.springframework.stereotype.Component;

@ViewScoped
@Component
public class LinkCrudMBean extends CrudMBean<Link, Long> {

	private static final long serialVersionUID = 1L;

	@Override
	protected Link createBean() {
		return Link.builder().build();
	}

}
