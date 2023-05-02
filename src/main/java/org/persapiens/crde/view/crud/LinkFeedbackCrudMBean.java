package org.persapiens.crde.view.crud;

import jakarta.faces.view.ViewScoped;
import jakarta.inject.Named;

import org.persapiens.crde.domain.LinkFeedback;

/**
 * CrudMBean de Categoria.
 * @author Marcelo Fernandes
 */
@ViewScoped
@Named
public class LinkFeedbackCrudMBean extends CrudMBean<LinkFeedback, Long> {

	private static final long serialVersionUID = 1L;

	@Override
	protected LinkFeedback createBean() {
		return LinkFeedback.builder().build();
	}

}
