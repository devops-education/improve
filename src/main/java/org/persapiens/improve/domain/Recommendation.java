package org.persapiens.improve.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.SortedSet;
import java.util.stream.Collectors;

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
public class Recommendation implements IdBean<Long>, Comparable<Recommendation> {

    private static final long serialVersionUID = 1L;

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
    private SortedSet<RecommendationInterview> recommendationInterviews;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @Singular
    @OneToMany(mappedBy = "recommendation1")
    private Set<RecommendationsConflict> recommendation1Conflicts;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @Singular
    @OneToMany(mappedBy = "recommendation2")
    private Set<RecommendationsConflict> recommendation2Conflicts;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @Singular
    @OneToMany(mappedBy = "recommendation")
    private Set<ChallengeRecommendationConflict> challengeConflicts;

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
    
    public Set<Recommendation> getRecommendationConflicts() {
        Set result = new HashSet<>();
        result.addAll(recommendation1Conflicts.stream().map(RecommendationsConflict::getRecommendation2).collect(Collectors.toSet()));
        result.addAll(recommendation2Conflicts.stream().map(RecommendationsConflict::getRecommendation1).collect(Collectors.toSet()));
        return result;
    }
    
    public Set<TeachingMethodLink> getTeachingMethodLinks() {
        Set<TeachingMethodLink> result = TeachingMethodLink.getSetSortedByTeachingMethodAndInterviewSnippet();
        for (Link link: getLinks()) {
            result.addAll(link.getTeachingMethodLinks());
        }
        return result;
    }
}
