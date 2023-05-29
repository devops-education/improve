package org.persapiens.crde.domain;

import java.io.Serializable;
import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

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
@ToString(of = {"id", "descricao"})
@EqualsAndHashCode(of = "descricao")
@SuperBuilder
@Entity
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class Tag implements Serializable, Comparable<Tag> {

    private static final long serialVersionUID = 1L;

    @Id
    private Long id;

    @Column(nullable = false, unique = true)
    private String descricao;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @Singular
    @OneToMany(mappedBy = "tag")
    private Set<ChallengeTag> challengeTags;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @Singular
    @OneToMany(mappedBy = "tag")
    private Set<RecommendationTag> recommendationTags;

    @Override
    public int compareTo(Tag o) {
        return this.descricao.compareTo(o.descricao);
    }

}
