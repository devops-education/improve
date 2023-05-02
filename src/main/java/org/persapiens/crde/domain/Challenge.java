package org.persapiens.crde.domain;

import jakarta.persistence.Column;
import java.io.Serializable;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.Comparator;
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
@ToString(exclude = {"challengeTags", "links"})
@EqualsAndHashCode(of = {"id"})
@SuperBuilder
@Entity
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class Challenge implements Serializable, Comparable<Challenge> {

    private static final long serialVersionUID = 1L;
    private static final int LENGTH = 40000;

    @Id
    private Long id;

    @Column(nullable = false, length = LENGTH)
    private String interviewQuotes;
    @Column(nullable = false, length = LENGTH)
    private String abstracts;
    @Column(length = LENGTH)
    private String mainIdea;
    @Column(nullable = false, length = LENGTH)
    private String code;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private Theme theme;
    @Column(nullable = false)
    private boolean specific;
    @Column(nullable = false)
    private long amountOfInterviews;
    @Column(nullable = false, length = LENGTH)
    private String tags;
    @Column(nullable = false, length = LENGTH)
    private String allText;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @Singular
    @OneToMany(mappedBy = "challenge")
    private Set<ChallengeTag> challengeTags;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @Singular
    @OneToMany(mappedBy = "challenge")
    private Set<Link> links;

    @Override
    public int compareTo(Challenge o) {
        return Comparator.comparing(Challenge::getMainIdea)
                .thenComparing(Challenge::getTheme)
                .thenComparing(Challenge::isSpecific)
                .thenComparing(Challenge::getAbstracts)
                .thenComparing(Challenge::getInterviewQuotes)
                .thenComparing(Challenge::getAmountOfInterviews)
                .compare(this, o);
    }
}
