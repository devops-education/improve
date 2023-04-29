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

/**
 * Valor Inicial do Dono na Conta Patrimonio entity.
 *
 * @author Marcelo Fernandes
 */
@Getter
@Setter
@ToString
@EqualsAndHashCode(exclude = {"recommendationTags", "links"})
@SuperBuilder
@Entity
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class Recommendation implements Serializable, Comparable<Recommendation> {

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
    @OneToMany(mappedBy = "recommendation")
    private Set<RecommendationTag> recommendationTags;

    @Singular
    @OneToMany(mappedBy = "recommendation")
    private Set<Link> links;

    @Override
    public int compareTo(Recommendation o) {
        return Comparator.comparing(Recommendation::getMainIdea)
                .thenComparing(Recommendation::getTheme)
                .thenComparing(Recommendation::isSpecific)
                .thenComparing(Recommendation::getAbstracts)
                .thenComparing(Recommendation::getInterviewQuotes)
                .thenComparing(Recommendation::getAmountOfInterviews)
                .compare(this, o);
    }

}
