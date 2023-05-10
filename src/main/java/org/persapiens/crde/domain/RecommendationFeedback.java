package org.persapiens.crde.domain;

import jakarta.persistence.Column;
import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.ForeignKey;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
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
@EqualsAndHashCode(of = {"recommendation", "username"})
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
@Entity
@SequenceGenerator(sequenceName = "seq_recommendation_feedback", name = "ID_SEQUENCE", allocationSize = 1)
public class RecommendationFeedback implements Serializable, Comparable<RecommendationFeedback> {

    private static final long serialVersionUID = 1L;
    private static final int LENGTH = 40000;

    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ID_SEQUENCE")
    @Id
    private Long id;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @NonNull
    @ManyToOne
    @JoinColumn(nullable = false, foreignKey = @ForeignKey(name = "fk_recommendationFeedback_recommendation"))
    private Recommendation recommendation;
    
    @Column(nullable = false)
    private String username;

    @Column
    private Boolean known;

    @Column
    private Boolean usedAlready;

    @Column
    private Boolean willUse;

    @Column(length = LENGTH)
    private String knownComment;

    @Column(length = LENGTH)
    private String usedAlreadyComment;

    @Column(length = LENGTH)
    private String willUseComment;

    @Override
    public int compareTo(RecommendationFeedback o) {
        return Comparator.comparing(RecommendationFeedback::getRecommendation)
                .thenComparing(RecommendationFeedback::getUsername)
                .thenComparing(Comparator.nullsLast(Comparator.comparing(RecommendationFeedback::getKnown)))
                .thenComparing(Comparator.nullsLast(Comparator.comparing(RecommendationFeedback::getUsedAlready)))
                .thenComparing(Comparator.nullsLast(Comparator.comparing(RecommendationFeedback::getWillUse)))
                .compare(this, o);
    }

}
