package org.persapiens.improve.view.converter;

import jakarta.faces.component.UIComponent;
import jakarta.faces.context.FacesContext;
import jakarta.faces.convert.Converter;
import jakarta.faces.view.ViewScoped;
import org.persapiens.improve.domain.Rating;
import org.springframework.stereotype.Component;

@ViewScoped
@Component
public class RatingConverter implements Converter<Rating> {

    private static final long serialVersionUID = 1L;

    @Override
    public Rating getAsObject(FacesContext fc, UIComponent uic, String string) {
        switch (string) {
            case "1":
                return Rating.FULLY_DISAGREE;
            case "2":
                return Rating.DISAGREE;
            case "3":
                return Rating.NEUTRAL;
            case "4":
                return Rating.AGREE;
            case "5":
                return Rating.FULLY_AGREE;
        }
        throw new IllegalArgumentException("Invalid id: " + string);
    }

    @Override
    public String getAsString(FacesContext fc, UIComponent uic, Rating t) {
        return Integer.toString(t.getCode());
    }

}
