package org.persapiens.improve.persistence;

import com.querydsl.jpa.JPQLQueryFactory;
import com.querydsl.jpa.impl.JPAQueryFactory;
import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.persistence.EntityManager;
import java.util.List;
import org.persapiens.improve.domain.QRecommendation;
import org.persapiens.improve.domain.QRecommendationInterview;
import org.persapiens.improve.domain.Recommendation;
import org.springframework.beans.factory.annotation.Autowired;

public class RecommendationRepositoryImpl implements RecommendationRepositoryCustom {

    private final EntityManager entityManager;

    @SuppressFBWarnings("EI_EXPOSE_REP2")
    @Autowired
    public RecommendationRepositoryImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<Recommendation> findByOrderByRecommendationInterviewsSizeDesc() {
        QRecommendation recommendation = QRecommendation.recommendation;
        QRecommendationInterview recommendationInterview = QRecommendationInterview.recommendationInterview;
        JPQLQueryFactory query = new JPAQueryFactory(this.entityManager);

        return query.from(recommendation)
                .select(recommendation)
                .leftJoin(recommendation.recommendationInterviews, recommendationInterview).fetchJoin()
                .orderBy(recommendation.recommendationInterviews.size().desc())
                .fetch();
    }

    @Override
    public List<Recommendation> findByLeftJoinLinksOrderByRecommendationInterviewsSizeDesc() {
        QRecommendation recommendation = QRecommendation.recommendation;
        QRecommendationInterview recommendationInterview = QRecommendationInterview.recommendationInterview;
        JPQLQueryFactory query = new JPAQueryFactory(this.entityManager);

        return query.from(recommendation)
                .select(recommendation)
                .leftJoin(recommendation.links).fetchJoin()
                .leftJoin(recommendation.recommendationInterviews, recommendationInterview).fetchJoin()
                .orderBy(recommendation.recommendationInterviews.size().desc())
                .fetch();
    }
}
