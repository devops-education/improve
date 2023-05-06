package org.persapiens.crde.view.options;

import jakarta.faces.view.ViewScoped;
import jakarta.inject.Named;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.persapiens.crde.domain.Rating;
import org.persapiens.crde.domain.Theme;

@ViewScoped
@Named
public class ThemeOptions extends Options<Theme, Rating> {

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
        ArrayList<Theme> result = new ArrayList<>(Arrays.asList(Theme.values()));
        Collections.sort(result);
        return result;
    }
}
