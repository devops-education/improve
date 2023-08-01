package org.persapiens.improve.domain;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import java.io.Serializable;
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
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@Getter
@Setter
@ToString
@EqualsAndHashCode(of = {"interview", "recommendation"})
@SuperBuilder
@Entity
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class RecommendationInterview implements Serializable, Comparable<RecommendationInterview> {

    private static final long serialVersionUID = 1L;
    private static final int LENGTH = 40000;

    @EmbeddedId
    private RecommendationInterviewId id;

    @Column(nullable = false, length = LENGTH)
    private String quote;
    @Column(nullable = false, length = LENGTH)
    private String resume;
    
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @ManyToOne
    @JoinColumn(name= "interview", nullable = false, insertable = false, updatable = false, foreignKey = @ForeignKey(name = "fk_recommendationinterview_interview"))
    private Interview interview;
    
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @ManyToOne
    @JoinColumn(name= "recommendation", nullable = false, insertable = false, updatable = false, foreignKey = @ForeignKey(name = "fk_recommendationinterview_recommendation"))
    private Recommendation recommendation;

    @Override
    public int compareTo(RecommendationInterview o) {
        return Comparator.comparing(RecommendationInterview::getRecommendation)
                .thenComparing(RecommendationInterview::getInterview)
                .thenComparing(RecommendationInterview::getQuote)
                .compare(this, o);
    }
}
