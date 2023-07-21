package org.persapiens.crde.persistence;

import com.querydsl.jpa.JPQLQueryFactory;
import com.querydsl.jpa.impl.JPAQueryFactory;
import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import java.util.Optional;
import org.persapiens.crde.domain.ChallengeFeedback;
import org.persapiens.crde.domain.QChallenge;
import org.persapiens.crde.domain.QChallengeFeedback;
import org.persapiens.crde.domain.QLink;
import org.persapiens.crde.domain.QRecommendation;


public class ChallengeFeedbackRepositoryImpl implements ChallengeFeedbackRepositoryCustom {

    private final EntityManager entityManager;

    @SuppressFBWarnings("EI_EXPOSE_REP2")
    @Inject
    public ChallengeFeedbackRepositoryImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public Optional<ChallengeFeedback> findDetailById(Long id) {
        QChallengeFeedback challengeFeedback = QChallengeFeedback.challengeFeedback;
        QChallenge challenge = QChallenge.challenge;
        QLink link = QLink.link;
        QRecommendation recommendation = QRecommendation.recommendation;
        JPQLQueryFactory query = new JPAQueryFactory(this.entityManager);

        return Optional.of(query.from(challengeFeedback)
                .select(challengeFeedback)
                .leftJoin(challengeFeedback.challenge, challenge).fetchJoin()
                .leftJoin(challenge.links, link).fetchJoin()
                .leftJoin(link.recommendation, recommendation).fetchJoin()
                .leftJoin(recommendation.recommendationInterviews).fetchJoin()
                .leftJoin(challenge.challengeInterviews).fetchJoin()
                .leftJoin(challenge.challengeTags).fetchJoin()
                .where(challengeFeedback.id.eq(id))
                .fetchOne());
    }
}
