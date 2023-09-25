package org.persapiens.improve.view.crud;

import jakarta.faces.view.ViewScoped;
import lombok.extern.slf4j.Slf4j;
import org.persapiens.improve.domain.Recommendation;
import org.springframework.stereotype.Component;

@Slf4j
@ViewScoped
@Component
public class RecommendationCrudMBean extends CrudMBean<Recommendation, Long> {

    private static final long serialVersionUID = 1L;

    @Override
    protected Recommendation createBean() {
        return Recommendation.builder().build();
    }

    @Override
    public boolean isCheckStartUpdate(Recommendation bean) {
        return true;
    }

}
