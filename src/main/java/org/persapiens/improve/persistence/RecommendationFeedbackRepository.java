package org.persapiens.improve.persistence;

import java.util.Collection;
import java.util.List;
import org.persapiens.improve.domain.Recommendation;
import org.persapiens.improve.domain.RecommendationFeedback;

import org.springframework.data.repository.CrudRepository;

public interface RecommendationFeedbackRepository extends CrudRepository<RecommendationFeedback, Long>, RecommendationFeedbackRepositoryCustom {
    List<RecommendationFeedback> findByUsername(String username);
    
    List<RecommendationFeedback> findByRecommendationInAndUsername(Collection<Recommendation> recommendations, String username);
    
    /**
     * lista de recomendacoes por pretendo usar e nao utilizava.
     * ordenar por nao conhecia.
     * @param username usuario
     * @return lista de recomendacoes
     */
    List<RecommendationFeedback> findByUsernameAndUsedAlreadyIsFalseAndWillUseIsTrueOrderByKnownAsc(String username);    
}
