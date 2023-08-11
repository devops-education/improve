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
import org.persapiens.improve.domain.RecommendationFeedback;
import org.persapiens.improve.domain.RecommendationsConflict;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
public class RecommendationsConflictRecommendationFeedback implements Serializable, Comparable<RecommendationsConflictRecommendationFeedback> {

    private static final long serialVersionUID = 1L;
    
    private RecommendationsConflict conflict;
    
    private RecommendationFeedback recommendationFeedback;
    
    @Override
    public int compareTo(RecommendationsConflictRecommendationFeedback o) {
        return Comparator.comparing(RecommendationsConflictRecommendationFeedback::getRecommendationFeedback)
                .thenComparing(RecommendationsConflictRecommendationFeedback::getConflict)
                .compare(this, o);
    }

}
