package org.persapiens.improve.view.crud;

import jakarta.faces.view.ViewScoped;

import org.persapiens.improve.domain.User;
import org.persapiens.improve.view.bean.ViewLogMBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@ViewScoped
@Component
public class UserCrudMBean extends CrudMBean<User, Long> {

	private static final long serialVersionUID = 1L;

	@Autowired
	private ViewLogMBean viewLogMBean;

	@Override
	protected User createBean() {
		return User.builder().build();
	}

	@Override
	public boolean isCheckStartUpdate(User bean) {
		return true;
	}

	@Override
	public boolean isCheckStartInsert(User bean) {
		return true;
	}

	@Override
	protected void init() {
		super.init();
		viewLogMBean.logUser();
	}

}
