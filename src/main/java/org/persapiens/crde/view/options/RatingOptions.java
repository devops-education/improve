package org.persapiens.crde.view.options;

import jakarta.faces.view.ViewScoped;
import jakarta.inject.Named;
import java.util.Arrays;
import java.util.List;
import org.persapiens.crde.domain.Rating;

@ViewScoped
@Named
public class RatingOptions extends Options<Rating, Rating> {

    private static final long serialVersionUID = 1L;

    @Override
    public String label(Rating e) {
        return e.getDescription();
    }

    @Override
    protected Object key(Rating e) {
        return e;
    }

    @Override
    protected List<Rating> fillList() {
        return Arrays.asList(Rating.values());
    }
}
