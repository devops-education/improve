package org.persapiens.improve.view.options;

import jakarta.faces.view.ViewScoped;
import java.util.Arrays;
import java.util.List;
import org.springframework.stereotype.Component;

@ViewScoped
@Component
public class BooleanOptions extends Options<Boolean, Boolean> {

    private static final long serialVersionUID = 1L;

    @Override
    public String label(Boolean e) {
        String result = "";
        if (e != null) {
            result = e ? "Yes" : "No";
        }
        return result;
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
