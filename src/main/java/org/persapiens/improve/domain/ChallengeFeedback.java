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
import java.time.LocalDateTime;
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
@EqualsAndHashCode(of = { "challenge", "user" })
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
@Entity
@SequenceGenerator(sequenceName = "seq_challenge_feedback", name = "ID_SEQUENCE", allocationSize = 1)
@Table(indexes = @Index(name = "idx_challengefeedback_challenge_user", unique = true,
		columnList = "challenge_id, user_id"))
public class ChallengeFeedback implements IdBean<Long>, Comparable<ChallengeFeedback> {

	private static final long serialVersionUID = 1L;

	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ID_SEQUENCE")
	@Id
	private Long id;

	@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
	@NonNull
	@ManyToOne
	@JoinColumn(nullable = false, foreignKey = @ForeignKey(name = "fk_challengeFeedback_challenge"))
	private Challenge challenge;

	@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
	@NonNull
	@ManyToOne
	@JoinColumn(nullable = false, foreignKey = @ForeignKey(name = "fk_challengeFeedback_user"))
	private User user;

	@Column
	private Boolean willMitigate;

	@Column(length = LENGTH)
	private String willMitigateComment;

	@Column(nullable = false)
	private LocalDateTime insertTime;

	@Column(nullable = false)
	private LocalDateTime updateTime;

	@Override
	public int compareTo(ChallengeFeedback o) {
		return Comparator.comparing(ChallengeFeedback::getChallenge)
			.thenComparing(ChallengeFeedback::getUser)
			.thenComparing(Comparator.nullsLast(Comparator.comparing(ChallengeFeedback::getWillMitigate)))
			.compare(this, o);
	}

	public void insert() {
		LocalDateTime now = LocalDateTime.now();
		insertTime = now;
		updateTime = now;
	}

	public void update() {
		updateTime = LocalDateTime.now();
	}

}
