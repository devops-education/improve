package org.persapiens.crde.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.ForeignKey;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import java.io.Serializable;
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

@Getter
@Setter
@ToString
@EqualsAndHashCode
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
@Entity
@IdClass(RecommendationTagId.class)
public class RecommendationTag implements Serializable, Comparable<RecommendationTag> {

    private static final long serialVersionUID = 1L;

    @Id
    @NonNull
    @ManyToOne
    @JoinColumn(name= "recommendation", nullable = false, foreignKey = @ForeignKey(name = "fk_recommendationTag_recommendation"))
    private Recommendation recommendation;

    @Id
    @NonNull
    @ManyToOne
    @JoinColumn(name= "tag", nullable = false, foreignKey = @ForeignKey(name = "fk_recommendationTag_tag"))
    private Tag tag;

    @Override
    public int compareTo(RecommendationTag o) {
        return Comparator.comparing(RecommendationTag::getRecommendation)
                .thenComparing(RecommendationTag::getTag)
                .compare(this, o);
    }
}
