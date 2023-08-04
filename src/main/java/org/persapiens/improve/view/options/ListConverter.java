package org.persapiens.improve.view.options;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.faces.component.UIComponent;
import jakarta.faces.context.FacesContext;
import jakarta.faces.convert.Converter;
import java.util.List;
import java.util.Objects;

public class ListConverter implements Converter<Object> {

    private List<?> list;

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        for (Object listValue : list) {
            String convertedListValue = getAsString(context, component, listValue);
            if (Objects.equals(value, convertedListValue)) {
                return listValue;
            }
        }

        return null;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        if (value == null) {
            return null;
        }

        return value.toString();
    }

    /**
     * Sets the list of available items.
     *
     * @param list The list of available items.
     */
    @SuppressFBWarnings("EI_EXPOSE_REP2")
    public void setList(List<?> list) {
        this.list = list;
    }

}
