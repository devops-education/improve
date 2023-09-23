package org.persapiens.improve.domain;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.SequenceGenerator;
import java.util.Set;
import java.util.HashSet;

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
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Getter
@Setter
@ToString
@EqualsAndHashCode(of = "username")
@SuperBuilder
@SequenceGenerator(sequenceName = "seq_user", name = "ID_SEQUENCE", allocationSize = 1)
@Entity(name = "users")
public class User implements IdBean<Long>, Comparable<User> {

	private static final long serialVersionUID = 1L;

	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ID_SEQUENCE")
	@Id
	private Long id;

	@Column(nullable = false, unique = true)
	private String username;

	@Column(nullable = false)
	private String password;

	@Column(nullable = false)
	private boolean active;

	@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
	@Singular
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
	private Set<Authority> authorities;

	@Override
	public int compareTo(User o) {
		return this.username.compareTo(o.username);
	}

	public boolean isAdmin() {
		boolean result = false;
		for (Authority authority : getAuthorities()) {
			if (authority.getAuthority().equals(Authority.ROLE_ADMIN)) {
				result = true;
				break;
			}
		}
		return result;
	}

	public void setAdmin(boolean admin) {
		if (isAdmin() != admin) {
			String authority;
			if (admin) {
				authority = Authority.ROLE_ADMIN;
			}
			else {
				authority = Authority.ROLE_USER;
			}
			setAuthorities(new HashSet<>());

			getAuthorities().add(Authority.builder().authority(authority).user(this).build());
		}
	}

	public UserDetails userDetails() {
		User user = this;
		PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		return org.springframework.security.core.userdetails.User.builder()
			.username(user.getUsername())
			.password(encoder.encode(user.getPassword()))
			.disabled(!user.isActive())
			.authorities(user.getAuthorities().stream().map(u -> u.getAuthority()).toArray(String[]::new))
			.build();
	}

}
