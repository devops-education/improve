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
import lombok.NonNull;
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
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
@Entity
@IdClass(ChallengeTagId.class)
public class ChallengeTag implements Serializable, Comparable<ChallengeTag> {

    private static final long serialVersionUID = 1L;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @Id
    @NonNull
    @ManyToOne
    @JoinColumn(name = "challenge", nullable = false, foreignKey = @ForeignKey(name = "fk_challengeTag_challenge"))
    private Challenge challenge;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @Id
    @NonNull
    @ManyToOne
    @JoinColumn(name= "tag", nullable = false, foreignKey = @ForeignKey(name = "fk_challengeTag_tag"))
    private Tag tag;

    @Override
    public int compareTo(ChallengeTag o) {
        return Comparator.comparing(ChallengeTag::getChallenge)
                .thenComparing(ChallengeTag::getTag)
                .compare(this, o);
    }

}
