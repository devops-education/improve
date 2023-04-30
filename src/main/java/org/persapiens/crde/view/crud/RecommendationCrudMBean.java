package org.persapiens.crde.view.crud;

import jakarta.faces.view.ViewScoped;
import jakarta.inject.Named;

import org.persapiens.crde.domain.Recommendation;

/**
 * CrudMBean de ValorInicialDoDonoNaContaPatrimonio.
 *
 * @author Marcelo Fernandes
 */
@ViewScoped
@Named
public class RecommendationCrudMBean extends CrudMBean<Recommendation, Long> {

    private static final long serialVersionUID = 1L;

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
    
}
