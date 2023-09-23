package org.persapiens.improve.view.crud;

import java.io.Serializable;

import java.util.Comparator;
import java.util.List;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.SuperBuilder;
import org.persapiens.improve.domain.TeachingMethodFeedback;
import org.persapiens.improve.domain.TeachingMethodLink;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
public class TeachingMethodLinksTeachingMethodFeedback
		implements Serializable, Comparable<TeachingMethodLinksTeachingMethodFeedback> {

	private static final long serialVersionUID = 1L;

	private List<TeachingMethodLink> teachingMethodLinks;

	private TeachingMethodFeedback teachingMethodFeedback;

	@Override
	public int compareTo(TeachingMethodLinksTeachingMethodFeedback o) {
		return Comparator.comparing(TeachingMethodLinksTeachingMethodFeedback::getTeachingMethodFeedback)
			.compare(this, o);
	}

}
