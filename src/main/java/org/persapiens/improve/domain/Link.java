package org.persapiens.improve.domain;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.ForeignKey;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
@ToString
@EqualsAndHashCode(of = {"challenge", "recommendation"})
@SuperBuilder
@Entity
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class Link implements IdBean<LinkId>, Comparable<Link> {

    private static final long serialVersionUID = 1L;

    @EmbeddedId
    private LinkId id;
    
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @ManyToOne
    @JoinColumn(name= "challenge", nullable = false, insertable = false, updatable = false, foreignKey = @ForeignKey(name = "fk_link_challenge"))
    private Challenge challenge;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @ManyToOne
    @JoinColumn(name = "recommendation", nullable = false, insertable = false, updatable = false, foreignKey = @ForeignKey(name = "fk_link_recommendation"))
    private Recommendation recommendation;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @Singular
    @OneToMany(mappedBy = "link")
    private Set<TeachingMethodLink> teachingMethodLinks;

    @Override
    public int compareTo(Link o) {
        return Comparator.comparing(Link::getChallenge)
                .thenComparing(Link::getRecommendation)
                .compare(this, o);
    }

}
