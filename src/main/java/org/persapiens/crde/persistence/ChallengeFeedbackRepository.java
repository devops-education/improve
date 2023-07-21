package org.persapiens.crde.persistence;

import java.util.Collection;
import java.util.List;
import org.persapiens.crde.domain.Challenge;
import org.persapiens.crde.domain.ChallengeFeedback;

import org.springframework.data.repository.CrudRepository;

public interface ChallengeFeedbackRepository extends CrudRepository<ChallengeFeedback, Long>, ChallengeFeedbackRepositoryCustom {
    List<ChallengeFeedback> findByUsername(String username);
    
    List<ChallengeFeedback> findByChallengeInAndUsername(Collection<Challenge> challenge, String username);
    
    /**
     * lista de desafios filtro que pretende mitigar sem nenhuma recomendação utilizada e não pretende usar.
     * @param username usuario
     * @return de challenge feedback
     */
    List<ChallengeFeedback> findByUsernameAndWillMitigateIsTrueOrderByKnownAsc(String username);
}
