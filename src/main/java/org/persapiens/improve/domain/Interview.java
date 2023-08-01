package org.persapiens.improve.domain;

import jakarta.persistence.Column;
import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

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
@EqualsAndHashCode(of = "interviewee")
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
@Entity
public class Interview implements Serializable, Comparable<Interview> {

    private static final long serialVersionUID = 1L;

    @Id
    private Long id;

    @Column(nullable = false, unique = true)
    private String interviewee;

    @Override
    public int compareTo(Interview o) {
        return this.interviewee.compareTo(o.interviewee);
    }

}
