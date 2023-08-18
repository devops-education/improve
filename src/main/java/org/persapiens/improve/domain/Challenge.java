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
import java.util.List;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

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
@ToString(exclude = {"challengeTags", "links", "challengeInterviews"})
@EqualsAndHashCode(of = {"mainIdea"})
@SuperBuilder
@Entity
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class Challenge implements IdBean<Long>, Comparable<Challenge> {

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
    @OneToMany(mappedBy = "challenge")
    private Set<ChallengeTag> challengeTags;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @Singular
    @OneToMany(mappedBy = "challenge")
    private Set<Link> links;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @Singular
    @OneToMany(mappedBy = "challenge")
    private SortedSet<ChallengeInterview> challengeInterviews;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @Singular
    @OneToMany(mappedBy = "challenge")
    private Set<ChallengeRecommendationConflict> conflicts;

    @Override
    public int compareTo(Challenge o) {
        return Comparator.comparing(Challenge::getMainIdea)
                .thenComparing(Challenge::getTheme)
                .thenComparing(Challenge::isSpecific)
                .compare(this, o);
    }

    public List<Link> getLinkSortedByRecommendationRecommendationInterviewsSizeList() {
        List<Link> result = new ArrayList<>();
        result.addAll(getLinks());
        Collections.sort(result, Comparator.comparing(Link::getRecommendation, (s1, s2) -> { return Long.valueOf(s1.getRecommendationInterviews().size() - s2.getRecommendationInterviews().size()).intValue();}).reversed());
        return result;
    }
    
    public Set<TeachingMethodLink> getTeachingMethodLinks() {
        Set<TeachingMethodLink> result = new TreeSet<>(Comparator
            .comparing(TeachingMethodLink::getTeachingMethod)
            .thenComparing(TeachingMethodLink::getInterviewSnippet)::compare);
        for (Link link: getLinks()) {
            result.addAll(link.getTeachingMethodLinks());
        }
        return result;
    }
}
