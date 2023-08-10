package org.persapiens.improve.domain;

import jakarta.persistence.Column;

import jakarta.persistence.Entity;
import jakarta.persistence.ForeignKey;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
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
@EqualsAndHashCode(of = {"challenge", "username"})
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
@Entity
@SequenceGenerator(sequenceName = "seq_challenge_feedback", name = "ID_SEQUENCE", allocationSize = 1)
public class ChallengeFeedback implements IdBean<Long>, Comparable<ChallengeFeedback> {

    private static final long serialVersionUID = 1L;

    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ID_SEQUENCE")
    @Id
    private Long id;

    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @NonNull
    @ManyToOne
    @JoinColumn(nullable = false, foreignKey = @ForeignKey(name = "fk_challengeFeedback_challenge"))
    private Challenge challenge;
    
    @Column(nullable = false)
    private String username;

    @Column
    private Boolean known;

    @Column
    private Boolean willMitigate;

    @Column(length = LENGTH)
    private String knownComment;

    @Column(length = LENGTH)
    private String willMitigateComment;

    @Override
    public int compareTo(ChallengeFeedback o) {
        return Comparator.comparing(ChallengeFeedback::getChallenge)
                .thenComparing(ChallengeFeedback::getUsername)
                .thenComparing(Comparator.nullsLast(Comparator.comparing(ChallengeFeedback::getKnown)))
                .thenComparing(Comparator.nullsLast(Comparator.comparing(ChallengeFeedback::getWillMitigate)))
                .compare(this, o);
    }

}
