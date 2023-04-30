package org.persapiens.crde.view.crud;

import jakarta.faces.view.ViewScoped;
import java.util.List;

import org.persapiens.crde.domain.Recommendation;
import org.persapiens.crde.persistence.RecommendationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * CrudMBean de ValorInicialDoDonoNaContaPatrimonio.
 *
 * @author Marcelo Fernandes
 */
@ViewScoped
@Component
public class RecommendationCrudMBean extends CrudMBean<Recommendation, Long> {

    private static final long serialVersionUID = 1L;

    @Autowired
    private RecommendationRepository recommendationRepository;
    
    @Override
    protected Recommendation createBean() {
        return Recommendation.builder().build();
    }

    @Override
    public boolean isCheckStartInsert(Recommendation bean) {
        return false;
    }

    @Override
    public boolean isCheckStartUpdate(Recommendation bean) {
        return false;
    }

    @Override
    public List<Recommendation> find() {
        return recommendationRepository.findByOrderByAmountOfInterviewsDesc();
    }
 
    
}
