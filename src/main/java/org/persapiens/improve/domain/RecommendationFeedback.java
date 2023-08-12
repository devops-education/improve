package org.persapiens.improve.domain;

import jakarta.persistence.Column;

import jakarta.persistence.Entity;
import jakarta.persistence.ForeignKey;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import java.time.LocalDateTime;
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
@EqualsAndHashCode(of = {"recommendation", "user"})
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
@Entity
@SequenceGenerator(sequenceName = "seq_recommendation_feedback", name = "ID_SEQUENCE", allocationSize = 1)
@Table(indexes = @Index(name = "idx_recommendationfeedback_recommendation_user", unique = true, columnList = "recommendation_id, user_id"))
public class RecommendationFeedback implements IdBean<Long>, Comparable<RecommendationFeedback> {

    private static final long serialVersionUID = 1L;

    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ID_SEQUENCE")
    @Id
    private Long id;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @NonNull
    @ManyToOne
    @JoinColumn(nullable = false, foreignKey = @ForeignKey(name = "fk_recommendationFeedback_recommendation"))
    private Recommendation recommendation;
    
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @NonNull
    @ManyToOne
    @JoinColumn(nullable = false, foreignKey = @ForeignKey(name = "fk_recommendationFeedback_user"))
    private User user;

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

    @Column(nullable = false)
    private LocalDateTime insertTime;
    
    @Column(nullable = false)
    private LocalDateTime updateTime;

    @Override
    public int compareTo(RecommendationFeedback o) {
        return Comparator.comparing(RecommendationFeedback::getRecommendation)
                .thenComparing(RecommendationFeedback::getUser)
                .thenComparing(Comparator.nullsLast(Comparator.comparing(RecommendationFeedback::getKnown)))
                .thenComparing(Comparator.nullsLast(Comparator.comparing(RecommendationFeedback::getUsedAlready)))
                .thenComparing(Comparator.nullsLast(Comparator.comparing(RecommendationFeedback::getWillUse)))
                .compare(this, o);
    }

    public void insert() {
        insertTime = LocalDateTime.now();
        updateTime = LocalDateTime.now();
    }

    public void update() {
        updateTime = LocalDateTime.now();
    }

}
