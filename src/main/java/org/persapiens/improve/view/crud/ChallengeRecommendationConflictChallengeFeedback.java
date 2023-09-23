package org.persapiens.improve.view.crud;

import java.io.Serializable;

import java.util.Comparator;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.SuperBuilder;
import org.persapiens.improve.domain.ChallengeRecommendationConflict;
import org.persapiens.improve.domain.ChallengeFeedback;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
public class ChallengeRecommendationConflictChallengeFeedback
		implements Serializable, Comparable<ChallengeRecommendationConflictChallengeFeedback> {

	private static final long serialVersionUID = 1L;

	private ChallengeRecommendationConflict conflict;

	private ChallengeFeedback challengeFeedback;

	@Override
	public int compareTo(ChallengeRecommendationConflictChallengeFeedback o) {
		return Comparator.comparing(ChallengeRecommendationConflictChallengeFeedback::getChallengeFeedback)
			.thenComparing(ChallengeRecommendationConflictChallengeFeedback::getConflict)
			.compare(this, o);
	}

}
