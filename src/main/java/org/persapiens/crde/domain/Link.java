package org.persapiens.crde.domain;

import java.io.Serializable;
import jakarta.persistence.Entity;
import jakarta.persistence.ForeignKey;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
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
@EqualsAndHashCode
@SuperBuilder
@Entity
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@IdClass(LinkId.class)
public class Link implements Serializable, Comparable<Link> {

    private static final long serialVersionUID = 1L;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @Id
    @ManyToOne
    @JoinColumn(name= "challenge", nullable = false, foreignKey = @ForeignKey(name = "fk_link_challenge"))
    private Challenge challenge;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @Id
    @ManyToOne
    @JoinColumn(name = "recommendation", nullable = false, foreignKey = @ForeignKey(name = "fk_link_recommendation"))
    private Recommendation recommendation;

    @Override
    public int compareTo(Link o) {
        return Comparator.comparing(Link::getChallenge)
                .thenComparing(Link::getRecommendation)
                .compare(this, o);
    }

}
