package org.persapiens.crde.persistence;

import com.querydsl.jpa.JPQLQueryFactory;
import com.querydsl.jpa.impl.JPAQueryFactory;
import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import java.util.List;
import org.persapiens.crde.domain.Challenge;
import org.persapiens.crde.domain.QChallenge;
import org.persapiens.crde.domain.QChallengeInterview;

public class ChallengeRepositoryImpl implements ChallengeRepositoryCustom {

    private final EntityManager entityManager;

    @SuppressFBWarnings("EI_EXPOSE_REP2")
    @Inject
    public ChallengeRepositoryImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<Challenge> findByOrderByChallengeInterviewsSizeDesc() {
        QChallenge challenge = QChallenge.challenge;
        QChallengeInterview challengeInterview = QChallengeInterview.challengeInterview;
        JPQLQueryFactory query = new JPAQueryFactory(this.entityManager);

        return query.from(challenge)
                .select(challenge)
                .leftJoin(challenge.challengeInterviews, challengeInterview).fetchJoin()
                .orderBy(challenge.challengeInterviews.size().desc())
                .fetch();
    }
}
