package org.persapiens.improve.view.crud;

import jakarta.faces.view.ViewScoped;
import lombok.extern.slf4j.Slf4j;
import org.persapiens.improve.view.AbstractMBean;
import org.persapiens.improve.view.bean.ViewLogMBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@ViewScoped
@Component
public class HomeMBean extends AbstractMBean {

	private static final long serialVersionUID = 1L;

	@Autowired
	private ViewLogMBean viewLogMBean;

	@Override
	protected void init() {
		super.init();
		viewLogMBean.logHome();
	}

	public String getEmptyToLog() {
		return "";
	}

}
