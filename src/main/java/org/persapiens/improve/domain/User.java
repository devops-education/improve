package org.persapiens.improve.domain;

import jakarta.persistence.Column;
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
@EqualsAndHashCode(of = "username")
@SuperBuilder
@Entity(name = "users")
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class User implements IdBean<Long>, Comparable<User> {

    private static final long serialVersionUID = 1L;

    @Id
    private Long id;

    @Column(nullable = false, unique = true)
    private String username;

    @Column(nullable = false)
    private String password;

    @Override
    public int compareTo(User o) {
        return this.username.compareTo(o.username);
    }

}
