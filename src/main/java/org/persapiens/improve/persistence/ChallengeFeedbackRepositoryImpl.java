package org.persapiens.improve.persistence;

import com.querydsl.jpa.JPQLQueryFactory;
import com.querydsl.jpa.impl.JPAQueryFactory;
import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.persistence.EntityManager;
import java.util.List;
import java.util.Optional;
import org.persapiens.improve.domain.ChallengeFeedback;
import org.persapiens.improve.domain.QChallenge;
import org.persapiens.improve.domain.QChallengeFeedback;
import org.persapiens.improve.domain.QLink;
import org.persapiens.improve.domain.QRecommendation;
import org.springframework.beans.factory.annotation.Autowired;


public class ChallengeFeedbackRepositoryImpl implements ChallengeFeedbackRepositoryCustom {

    private final EntityManager entityManager;

    @SuppressFBWarnings("EI_EXPOSE_REP2")
    @Autowired
    public ChallengeFeedbackRepositoryImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<ChallengeFeedback> findByUsernameLeftJoinChallengeLinks(String username) {
        QChallengeFeedback challengeFeedback = QChallengeFeedback.challengeFeedback;
        QChallenge challenge = QChallenge.challenge;
        QLink link = QLink.link;
        JPQLQueryFactory query = new JPAQueryFactory(this.entityManager);

        return query.from(challengeFeedback)
                .select(challengeFeedback)
                .leftJoin(challengeFeedback.challenge, challenge).fetchJoin()
                .leftJoin(challenge.links, link).fetchJoin()
                .leftJoin(challenge.challengeInterviews).fetchJoin()
                .where(challengeFeedback.username.eq(username))
                .orderBy(challenge.challengeInterviews.size().desc())
                .fetch();
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
