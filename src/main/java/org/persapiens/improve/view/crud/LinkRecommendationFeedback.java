package org.persapiens.improve.view.crud;

import java.io.Serializable;

import java.util.Comparator;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.SuperBuilder;
import org.persapiens.improve.domain.Link;
import org.persapiens.improve.domain.RecommendationFeedback;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
public class LinkRecommendationFeedback implements Serializable, Comparable<LinkRecommendationFeedback> {

	private static final long serialVersionUID = 1L;

	private Link link;

	private RecommendationFeedback recommendationFeedback;

	@Override
	public int compareTo(LinkRecommendationFeedback o) {
		return Comparator.comparing(LinkRecommendationFeedback::getRecommendationFeedback)
			.thenComparing(LinkRecommendationFeedback::getLink)
			.compare(this, o);
	}

}
