package org.persapiens.crde.domain;

import jakarta.persistence.Column;
import java.io.Serializable;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Set;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.Singular;
import lombok.ToString;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@Getter
@Setter
@ToString(exclude = {"recommendationTags", "links", "recommendationInterviews"})
@EqualsAndHashCode(of = {"mainIdea"})
@SuperBuilder
@Entity
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class Recommendation implements Serializable, Comparable<Recommendation> {

    private static final long serialVersionUID = 1L;
    private static final int LENGTH = 40000;

    @Id
    private Long id;

    @Column(length = LENGTH)
    private String mainIdea;
    @Column(nullable = false, length = LENGTH)
    private String code;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private Theme theme;
    @Column(nullable = false)
    private boolean specific;
    @Column(nullable = false, length = LENGTH)
    private String tags;

    /* to be removed
    @Column(nullable = false, length = LENGTH)
    private String interviewQuotes;
    @Column(nullable = false, length = LENGTH)
    private String abstracts;
    @Column(nullable = false)
    private long amountOfInterviews;
    @Column(nullable = false, length = LENGTH)
    private String allText;
    */

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @Singular
    @OneToMany(mappedBy = "recommendation")
    private Set<RecommendationTag> recommendationTags;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @Singular
    @OneToMany(mappedBy = "recommendation")
    private Set<Link> links;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @Singular
    @OneToMany(mappedBy = "recommendation")
    private Set<RecommendationInterview> recommendationInterviews;

    @Override
    public int compareTo(Recommendation o) {
        return Comparator.comparing(Recommendation::getMainIdea)
                .thenComparing(Recommendation::getTheme)
                .thenComparing(Recommendation::isSpecific)
                .compare(this, o);
    }

    public List<Link> getLinkSortedByChallengeChallengeInterviewsSizeList() {
        List<Link> result = new ArrayList<>();
        result.addAll(getLinks());
        Collections.sort(result, Comparator.comparing(Link::getChallenge, (s1, s2) -> { return Long.valueOf(s1.getChallengeInterviews().size()- s2.getChallengeInterviews().size()).intValue();}).reversed());
        return result;
    }
    
}
