package org.persapiens.improve.service;

import java.util.Set;
import java.util.stream.Collectors;
import lombok.Getter;
import org.persapiens.improve.domain.Challenge;
import org.persapiens.improve.domain.ChallengeTag;
import org.persapiens.improve.domain.ChallengeTagId;
import org.persapiens.improve.persistence.ChallengeTagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChallengeTagService extends InMemoryCrudService<ChallengeTag, ChallengeTagId> {

	@Getter
	@Autowired
	private ChallengeTagRepository repository;

	public Set<ChallengeTag> findByChallenge(Challenge challenge) {
		return getBeans().values().stream().filter(t -> t.getChallenge().equals(challenge)).collect(Collectors.toSet());
	}

}
