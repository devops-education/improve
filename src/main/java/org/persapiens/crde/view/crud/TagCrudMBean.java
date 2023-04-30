package org.persapiens.crde.view.crud;

import jakarta.faces.view.ViewScoped;
import jakarta.inject.Named;

import org.persapiens.crde.domain.Tag;

/**
 * CrudMBean de Dono.
 * @author Marcelo Fernandes
 */
@ViewScoped
@Named
public class TagCrudMBean extends CrudMBean<Tag, Long> {

	private static final long serialVersionUID = 1L;

	@Override
	protected Tag createBean() {
		return Tag.builder().build();
	}

}
