package org.persapiens.crde.view.validator;

import jakarta.faces.application.FacesMessage;
import jakarta.faces.component.UIComponent;
import jakarta.faces.context.FacesContext;
import jakarta.faces.validator.Validator;
import jakarta.faces.validator.ValidatorException;
import org.persapiens.crde.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;

public class SearchValidator <T> implements Validator<String> {

    @Autowired
    private SearchService<T> searchService;    
    
    @Override
    public void validate(FacesContext fc, UIComponent uic, String t) throws ValidatorException {
        String globalSearchErrorMessage = searchService.validate(t);
        
        if(!globalSearchErrorMessage.isEmpty()) {
            FacesMessage message = new FacesMessage(globalSearchErrorMessage);
            message.setSeverity(FacesMessage.SEVERITY_ERROR);
            throw new ValidatorException(message);
        }
        
    }
}
