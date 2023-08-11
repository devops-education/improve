package org.persapiens.improve.domain;

import jakarta.persistence.EmbeddedId;

import jakarta.persistence.Entity;
import jakarta.persistence.ForeignKey;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import java.util.Comparator;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@Getter
@Setter
@ToString(of= "id")
@EqualsAndHashCode(of = {"challenge", "recommendation"})
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
@Entity
public class ChallengeRecommendationConflict implements IdBean<ChallengeRecommendationConflictId>, 
        Comparable<ChallengeRecommendationConflict> {

    private static final long serialVersionUID = 1L;

    @EmbeddedId
    private ChallengeRecommendationConflictId id;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @NonNull
    @ManyToOne
    @JoinColumn(name = "challenge", nullable = false, insertable = false, updatable = false, foreignKey = @ForeignKey(name = "fk_challengeRecommendationConflict_challenge"))
    private Challenge challenge;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @NonNull
    @ManyToOne
    @JoinColumn(name= "recommendation", nullable = false, insertable = false, updatable = false, foreignKey = @ForeignKey(name = "fk_challengeRecommendationConflict_recommendation"))
    private Recommendation recommendation;

    @Override
    public int compareTo(ChallengeRecommendationConflict o) {
        return Comparator.comparing(ChallengeRecommendationConflict::getChallenge)
                .thenComparing(ChallengeRecommendationConflict::getRecommendation)
                .compare(this, o);
    }

}
