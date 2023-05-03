package org.persapiens.crde.view;

import jakarta.faces.view.ViewScoped;
import jakarta.inject.Named;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Named
@ViewScoped
public class ContentMBean extends AbstractMBean {

	private static final long serialVersionUID = 1L;

	private String page = "dono";
}
