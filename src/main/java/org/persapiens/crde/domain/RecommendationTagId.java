package org.persapiens.crde.domain;

import java.io.Serializable;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@EqualsAndHashCode
@AllArgsConstructor(access = AccessLevel.PUBLIC)
@NoArgsConstructor(access = AccessLevel.PUBLIC)
public class RecommendationTagId implements Serializable {

    private static final long serialVersionUID = 1L;

    private long recommendation;

    private long tag;

}
