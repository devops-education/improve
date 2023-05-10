package org.persapiens.crde.view.options;

import jakarta.faces.view.ViewScoped;
import jakarta.inject.Named;
import java.util.Arrays;
import java.util.List;

@ViewScoped
@Named
public class BooleanOptions extends Options<Boolean, Boolean> {

    private static final long serialVersionUID = 1L;

    @Override
    public String label(Boolean e) {
        return e ? "Yes" : "No";
    }

    @Override
    protected Object key(Boolean e) {
        return e;
    }

    @Override
    protected List<Boolean> fillList() {
        return Arrays.asList(Boolean.TRUE, Boolean.FALSE);
    }
}
