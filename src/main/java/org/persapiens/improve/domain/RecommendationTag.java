package org.persapiens.improve.domain;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.ForeignKey;
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
@EqualsAndHashCode(of = { "recommendation", "tag" })
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
@Entity
public class RecommendationTag implements IdBean<RecommendationTagId>, Comparable<RecommendationTag> {

	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private RecommendationTagId id;

	@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
	@NonNull
	@ManyToOne
	@JoinColumn(name = "recommendation", nullable = false, insertable = false, updatable = false,
			foreignKey = @ForeignKey(name = "fk_recommendationTag_recommendation"))
	private Recommendation recommendation;

	@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
	@NonNull
	@ManyToOne
	@JoinColumn(name = "tag", nullable = false, insertable = false, updatable = false,
			foreignKey = @ForeignKey(name = "fk_recommendationTag_tag"))
	private Tag tag;

	@Override
	public int compareTo(RecommendationTag o) {
		return Comparator.comparing(RecommendationTag::getRecommendation)
			.thenComparing(RecommendationTag::getTag)
			.compare(this, o);
	}

}
