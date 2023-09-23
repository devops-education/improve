package org.persapiens.improve.service;

import java.util.Set;
import java.util.stream.Collectors;
import lombok.Getter;
import org.persapiens.improve.domain.Recommendation;
import org.persapiens.improve.domain.RecommendationsConflict;
import org.persapiens.improve.domain.RecommendationsConflictId;
import org.persapiens.improve.persistence.RecommendationsConflictRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecommendationsConflictService
		extends InMemoryCrudService<RecommendationsConflict, RecommendationsConflictId> {

	@Getter
	@Autowired
	private RecommendationsConflictRepository repository;

	public Set<RecommendationsConflict> findByRecommendation1(Recommendation recommendation) {
		return getBeans().values()
			.stream()
			.filter(t -> t.getRecommendation1().equals(recommendation))
			.collect(Collectors.toSet());
	}

	public Set<RecommendationsConflict> findByRecommendation2(Recommendation recommendation) {
		return getBeans().values()
			.stream()
			.filter(t -> t.getRecommendation2().equals(recommendation))
			.collect(Collectors.toSet());
	}

}
