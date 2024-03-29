package org.persapiens.improve.view;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import jakarta.annotation.PostConstruct;
import jakarta.faces.application.FacesMessage;
import jakarta.faces.application.FacesMessage.Severity;
import jakarta.faces.context.ExternalContext;
import jakarta.faces.context.FacesContext;
import jakarta.faces.context.Flash;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.ConstraintViolationException;
import org.springframework.security.core.context.SecurityContextHolder;

public abstract class AbstractMBean implements Serializable {

	private static final long serialVersionUID = 1L;

	protected void addInfoMessage(String idMessages, String summary, String detail) {
		addMessage(idMessages, FacesMessage.SEVERITY_INFO, summary, detail);
	}

	protected void addWarnMessage(String idMessages, String summary, String detail) {
		addMessage(idMessages, FacesMessage.SEVERITY_WARN, summary, detail);
	}

	protected void addErrorMessage(String idMessages, String summary, String detail) {
		addMessage(idMessages, FacesMessage.SEVERITY_ERROR, summary, detail);
	}

	protected void addMessage(String idMessages, Severity severity, String summary, String detail) {
		FacesContext.getCurrentInstance().addMessage(idMessages, new FacesMessage(severity, summary, detail));
	}

	@PostConstruct
	protected void init() {
	}

	protected Boolean isRemovingFlash() {
		return false;
	}

	private Flash flash() {
		return FacesContext.getCurrentInstance().getExternalContext().getFlash();
	}

	protected void flashPut(String key, Object value) {
		Flash flash = flash();
		flash.put(key, value);
	}

	protected Object flashGet(String key) {
		Flash flash = flash();

		if (flash.size() > 0) {
			Object result = flash.get(key);

			if (isRemovingFlash()) {
				flash.values().remove(result);
			}

			return result;
		}
		return null;
	}

	protected String redirect(String url) {
		FacesContext fc = FacesContext.getCurrentInstance();
		ExternalContext ec = fc.getExternalContext();

		try {
			ec.redirect(url);
		}
		catch (IOException e) {
			throw new RuntimeException(e);
		}
		fc.responseComplete();

		return null;
	}

	protected String getRequestParameter(String key) {
		return FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get(key);
	}

	protected FacesContext facesContext() {
		return FacesContext.getCurrentInstance();
	}

	protected boolean empty(String s) {
		return s == null || s.isEmpty();
	}

	@SuppressWarnings("rawtypes")
	protected void tratarException(String idMessages, String evento, Exception e) {
		e.printStackTrace();

		if (e instanceof ConstraintViolationException) {
			ConstraintViolationException cve = (ConstraintViolationException) e;
			// adicionar mensagem de falha
			for (ConstraintViolation cv : cve.getConstraintViolations()) {
				String message = evento + " com falha: " + cv.getMessage();
				addErrorMessage(idMessages, message, message);
			}

		}
		else {
			// adicionar mensagem de falha
			String message = null;

			if (!evento.equalsIgnoreCase(e.getMessage())) {
				message = evento + " com falha: " + e.getMessage();
			}
			else {
				message = evento;
			}

			addErrorMessage(idMessages, message, message);
		}

		FacesContext.getCurrentInstance().validationFailed();
	}

	public <T> List<T> toList(final Iterable<T> iterable) {
		return StreamSupport.stream(iterable.spliterator(), false).collect(Collectors.toList());
	}

	protected String username() {
		return SecurityContextHolder.getContext().getAuthentication().getName();
	}

}
