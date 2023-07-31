package org.persapiens.crde.view.crud;

import jakarta.faces.view.ViewScoped;

import org.persapiens.crde.domain.Link;
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
