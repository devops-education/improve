package org.persapiens.improve.domain;

import jakarta.persistence.Embeddable;
import java.io.Serializable;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Embeddable
@ToString
@EqualsAndHashCode
@AllArgsConstructor(access = AccessLevel.PUBLIC)
@NoArgsConstructor(access = AccessLevel.PUBLIC)
public class RecommendationsConflictId implements Serializable {

	private static final long serialVersionUID = 1L;

	private long recommendation1;

	private long recommendation2;

}
