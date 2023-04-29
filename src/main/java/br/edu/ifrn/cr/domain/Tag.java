package br.edu.ifrn.cr.domain;

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

@Getter
@Setter
@ToString(of = {"id", "descricao"})
@EqualsAndHashCode(of = {"id", "descricao"})
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

	@Singular
	@OneToMany(mappedBy = "tag")
	private Set<ChallengeTag> challengeTags;

	@Singular
	@OneToMany(mappedBy = "tag")
	private Set<RecommendationTag> recommendationTags;

	@Override
	public int compareTo(Tag o) {
		return this.descricao.compareTo(o.descricao);
	}

}
