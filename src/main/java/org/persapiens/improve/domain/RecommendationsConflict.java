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
@ToString
@EqualsAndHashCode(of = {"recommendation1", "recommendation2"})
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
@Entity
public class RecommendationsConflict implements IdBean<RecommendationsConflictId>, Comparable<RecommendationsConflict> {

    private static final long serialVersionUID = 1L;

    @EmbeddedId
    private RecommendationsConflictId id;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @NonNull
    @ManyToOne
    @JoinColumn(name = "recommendation1", nullable = false, insertable = false, updatable = false, foreignKey = @ForeignKey(name = "fk_recommendationsConflict_recommendation1"))
    private Recommendation recommendation1;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @NonNull
    @ManyToOne
    @JoinColumn(name= "recommendation2", nullable = false, insertable = false, updatable = false, foreignKey = @ForeignKey(name = "fk_recommendationsConflict_recommendation2"))
    private Recommendation recommendation2;

    @Override
    public int compareTo(RecommendationsConflict o) {
        return Comparator.comparing(RecommendationsConflict::getRecommendation1)
                .thenComparing(RecommendationsConflict::getRecommendation2)
                .compare(this, o);
    }

}
