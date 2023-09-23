package org.persapiens.improve.view.options;

import jakarta.faces.view.ViewScoped;
import java.util.Arrays;
import java.util.List;
import org.persapiens.improve.domain.Theme;
import org.springframework.stereotype.Component;

@ViewScoped
@Component
public class ThemeOptions extends Options<Theme, Theme> {

	private static final long serialVersionUID = 1L;

	@Override
	public String label(Theme e) {
		return e.getValue();
	}

	@Override
	protected Object key(Theme e) {
		return e;
	}

	@Override
	protected List<Theme> fillList() {
		return Arrays.asList(Theme.values());
	}

}
