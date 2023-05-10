package org.persapiens.crde.persistence;

import com.querydsl.jpa.JPQLQueryFactory;
import com.querydsl.jpa.impl.JPAQueryFactory;
import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import java.util.List;
import org.persapiens.crde.domain.QRecommendation;
import org.persapiens.crde.domain.Recommendation;

public class RecommendationRepositoryImpl implements RecommendationRepositoryCustom {

    private final EntityManager entityManager;

    @SuppressFBWarnings("EI_EXPOSE_REP2")
    @Inject
    public RecommendationRepositoryImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<Recommendation> findByLeftJoinLinksOrderByAmountOfInterviewsDesc() {
        QRecommendation recommendation = QRecommendation.recommendation;
        JPQLQueryFactory query = new JPAQueryFactory(this.entityManager);

        return query.from(recommendation)
                .select(recommendation)
                .leftJoin(recommendation.links).fetchJoin()
                .orderBy(recommendation.amountOfInterviews.desc())
                .fetch();
    }
}
