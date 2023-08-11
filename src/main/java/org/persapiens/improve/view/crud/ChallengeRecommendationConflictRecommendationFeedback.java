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
import org.persapiens.improve.domain.RecommendationFeedback;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
public class ChallengeRecommendationConflictRecommendationFeedback implements Serializable, Comparable<ChallengeRecommendationConflictRecommendationFeedback> {

    private static final long serialVersionUID = 1L;
    
    private ChallengeRecommendationConflict conflict;
    
    private RecommendationFeedback recommendationFeedback;
    
    @Override
    public int compareTo(ChallengeRecommendationConflictRecommendationFeedback o) {
        return Comparator.comparing(ChallengeRecommendationConflictRecommendationFeedback::getRecommendationFeedback)
                .thenComparing(ChallengeRecommendationConflictRecommendationFeedback::getConflict)
                .compare(this, o);
    }

}
