package org.persapiens.improve.view.crud;

import jakarta.faces.view.ViewScoped;

import org.persapiens.improve.domain.Link;
import org.persapiens.improve.domain.LinkId;
import org.springframework.stereotype.Component;

@ViewScoped
@Component
public class LinkCrudMBean extends CrudMBean<Link, LinkId> {

	private static final long serialVersionUID = 1L;

	@Override
	protected Link createBean() {
		return Link.builder().build();
	}

}
