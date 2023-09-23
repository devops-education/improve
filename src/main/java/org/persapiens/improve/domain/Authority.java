package org.persapiens.improve.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.ForeignKey;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
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
@SuperBuilder
@Entity(name = "authorities")
@SequenceGenerator(sequenceName = "seq_authority", name = "ID_SEQUENCE", allocationSize = 1)
@Table(indexes = @Index(name = "idx_authority_user_authority", unique = true, columnList = "authority, user_id"))
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class Authority implements IdBean<Long>, Comparable<Authority> {

	private static final long serialVersionUID = 1L;

	public static final String ROLE_ADMIN = "ROLE_ADMIN";

	public static final String ROLE_USER = "ROLE_USER";

	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ID_SEQUENCE")
	@Id
	private Long id;

	@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
	@NonNull
	@ManyToOne
	@JoinColumn(name = "user_id", nullable = false, foreignKey = @ForeignKey(name = "fk_authority_user"))
	private User user;

	@Column(nullable = false)
	private String authority;

	@Override
	public int compareTo(Authority o) {
		return Comparator.comparing(Authority::getUser).thenComparing(Authority::getAuthority).compare(this, o);
	}

}
