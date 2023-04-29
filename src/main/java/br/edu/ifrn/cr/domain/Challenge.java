package br.edu.ifrn.cr.domain;

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

@Getter
@Setter
@ToString
@EqualsAndHashCode(exclude = {"challengeTags", "links"})
@SuperBuilder
@Entity
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class Challenge implements Serializable, Comparable<Challenge> {

    private static final long serialVersionUID = 1L;

    @Id
    private Long id;

    @Column(nullable = false)
    private String interviewQuotes;
    @Column(nullable = false)
    private String abstracts;
    @Column(nullable = false)
    private String mainIdea;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private Theme theme;
    @Column(nullable = false)
    private boolean specific;
    @Column(nullable = false)
    private long amountOfInterviews;
    @Column(nullable = false)
    private String allText;

    @Singular
    @OneToMany(mappedBy = "challenge")
    private Set<ChallengeTag> challengeTags;

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
