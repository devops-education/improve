package org.persapiens.improve.persistence;

import com.querydsl.jpa.JPQLQueryFactory;
import com.querydsl.jpa.impl.JPAQueryFactory;
import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.persistence.EntityManager;
import java.util.List;
import java.util.Optional;
import org.persapiens.improve.domain.QChallenge;
import org.persapiens.improve.domain.QLink;
import org.persapiens.improve.domain.QRecommendation;
import org.persapiens.improve.domain.QRecommendationFeedback;
import org.persapiens.improve.domain.RecommendationFeedback;
import org.springframework.beans.factory.annotation.Autowired;


public class RecommendationFeedbackRepositoryImpl implements RecommendationFeedbackRepositoryCustom {

    private final EntityManager entityManager;

    @SuppressFBWarnings("EI_EXPOSE_REP2")
    @Autowired
    public RecommendationFeedbackRepositoryImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<RecommendationFeedback> findByUsernameLeftJoinRecommendationLinks(String username) {
        QRecommendationFeedback recommendationFeedback = QRecommendationFeedback.recommendationFeedback;
        QRecommendation recommendation = QRecommendation.recommendation;
        QLink link = QLink.link;
        JPQLQueryFactory query = new JPAQueryFactory(this.entityManager);

        return query.from(recommendationFeedback)
                .select(recommendationFeedback)
                .leftJoin(recommendationFeedback.recommendation, recommendation).fetchJoin()
                .leftJoin(recommendation.links, link).fetchJoin()
                .leftJoin(recommendation.recommendationInterviews).fetchJoin()
                .where(recommendationFeedback.username.eq(username))
                .fetch();
    }

    @Override
    public Optional<RecommendationFeedback> findDetailById(Long id) {
        QRecommendationFeedback recommendationFeedback = QRecommendationFeedback.recommendationFeedback;
        QRecommendation recommendation = QRecommendation.recommendation;
        QLink link = QLink.link;
        QChallenge challenge = QChallenge.challenge;
        JPQLQueryFactory query = new JPAQueryFactory(this.entityManager);

        return Optional.of(query.from(recommendationFeedback)
                .select(recommendationFeedback)
                .leftJoin(recommendationFeedback.recommendation, recommendation).fetchJoin()
                .leftJoin(recommendation.links, link).fetchJoin()
                .leftJoin(link.challenge, challenge).fetchJoin()
                .leftJoin(challenge.challengeInterviews).fetchJoin()
                .leftJoin(recommendation.recommendationInterviews).fetchJoin()
                .leftJoin(recommendation.recommendationTags).fetchJoin()
                .where(recommendationFeedback.id.eq(id))
                .fetchOne());
    }
}
