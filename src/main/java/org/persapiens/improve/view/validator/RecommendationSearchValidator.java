package org.persapiens.improve.view.validator;

import jakarta.faces.view.ViewScoped;
import org.persapiens.improve.domain.Recommendation;
import org.springframework.stereotype.Component;

@ViewScoped
@Component
public class RecommendationSearchValidator extends SearchValidator<Recommendation> {
    private static final long serialVersionUID = 1L;
}
