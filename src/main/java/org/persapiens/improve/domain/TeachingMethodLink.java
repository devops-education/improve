package org.persapiens.improve.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.ForeignKey;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import java.util.Comparator;
import java.util.Set;
import java.util.TreeSet;

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
@EqualsAndHashCode(of = { "link", "teachingMethod" })
@SuperBuilder
@Entity
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class TeachingMethodLink implements IdBean<TeachingMethodLinkId>, Comparable<TeachingMethodLink> {

	private static final long serialVersionUID = 1L;

	@Id
	private TeachingMethodLinkId id;

	@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
	@NonNull
	@ManyToOne
	@JoinColumn(name = "challenge", nullable = false, insertable = false, updatable = false,
			foreignKey = @ForeignKey(name = "fk_teachingMethodLink_link"))
	@JoinColumn(name = "recommendation", nullable = false, insertable = false, updatable = false,
			foreignKey = @ForeignKey(name = "fk_teachingMethodLink_link"))
	private Link link;

	@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
	@NonNull
	@ManyToOne
	@JoinColumn(name = "teachingMethod", nullable = false, insertable = false, updatable = false,
			foreignKey = @ForeignKey(name = "fk_teachingMethodLink_teachingMethod"))
	private TeachingMethod teachingMethod;

	@Column(length = LENGTH)
	private String interviewSnippet;

	@Column(nullable = false)
	private boolean relevantLink;

	@Override
	public int compareTo(TeachingMethodLink o) {
		return Comparator.comparing(TeachingMethodLink::getLink)
			.thenComparing(TeachingMethodLink::getTeachingMethod)
			.thenComparing(TeachingMethodLink::isRelevantLink)
			.compare(this, o);
	}

	public static Set<TeachingMethodLink> getSetSortedByTeachingMethodAndInterviewSnippet() {
		return new TreeSet<>(Comparator.comparing(TeachingMethodLink::getTeachingMethod)
			.thenComparing(TeachingMethodLink::getInterviewSnippet)::compare);
	}

}
