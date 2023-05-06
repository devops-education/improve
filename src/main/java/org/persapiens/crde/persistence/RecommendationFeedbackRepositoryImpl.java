package org.persapiens.crde.persistence;

import com.querydsl.jpa.JPQLQueryFactory;
import com.querydsl.jpa.impl.JPAQueryFactory;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import java.util.List;
import java.util.Optional;
import org.persapiens.crde.domain.QLink;
import org.persapiens.crde.domain.QRecommendation;
import org.persapiens.crde.domain.QRecommendationFeedback;
import org.persapiens.crde.domain.RecommendationFeedback;


public class RecommendationFeedbackRepositoryImpl implements RecommendationFeedbackRepositoryCustom {

    private final EntityManager entityManager;

    @Inject
    public RecommendationFeedbackRepositoryImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<RecommendationFeedback> findByUsernameLeftJoinRecommendationLinks(String username) {
        QRecommendationFeedback recommendationFeedback = QRecommendationFeedback.recommendationFeedback;
        QRecommendation recommendation = QRecommendation.recommendation;
        QLink link = QLink.link;
        JPQLQueryFactory query = new JPAQueryFactory(this.entityManager);

        // soma todos os lancamentos de credito do dono na conta patrimonio
        return query.from(recommendationFeedback)
                .select(recommendationFeedback)
                .leftJoin(recommendationFeedback.recommendation, recommendation).fetchJoin()
                .leftJoin(recommendation.links, link).fetchJoin()
                //.leftJoin(link.challenge).fetchJoin()
                .where(recommendationFeedback.username.eq(username))
                .fetch();
    }

    @Override
    public Optional<RecommendationFeedback> findById(Long id) {
        QRecommendationFeedback recommendationFeedback = QRecommendationFeedback.recommendationFeedback;
        QRecommendation recommendation = QRecommendation.recommendation;
        JPQLQueryFactory query = new JPAQueryFactory(this.entityManager);

        // soma todos os lancamentos de credito do dono na conta patrimonio
        return Optional.of(query.from(recommendationFeedback)
                .select(recommendationFeedback)
                .leftJoin(recommendationFeedback.recommendation, recommendation).fetchJoin()
                .leftJoin(recommendation.links).fetchJoin()
                .where(recommendationFeedback.id.eq(id))
                .fetchOne());
    }
}
