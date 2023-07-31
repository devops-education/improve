package org.persapiens.crde.view.validator;

import jakarta.faces.view.ViewScoped;
import org.persapiens.crde.domain.Recommendation;
import org.springframework.stereotype.Component;

@ViewScoped
@Component
public class RecommendationSearchValidator extends SearchValidator<Recommendation> {
}
