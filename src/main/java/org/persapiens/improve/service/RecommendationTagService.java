package org.persapiens.improve.service;

import java.util.Set;
import java.util.stream.Collectors;
import lombok.Getter;
import org.persapiens.improve.domain.Recommendation;
import org.persapiens.improve.domain.RecommendationTag;
import org.persapiens.improve.domain.RecommendationTagId;
import org.persapiens.improve.persistence.RecommendationTagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecommendationTagService extends InMemoryCrudService<RecommendationTag, RecommendationTagId> {

	@Getter
	@Autowired
	private RecommendationTagRepository repository;

	public Set<RecommendationTag> findByRecommendation(Recommendation recommendation) {
		return getBeans().values()
			.stream()
			.filter(t -> t.getRecommendation().equals(recommendation))
			.collect(Collectors.toSet());
	}

}
