package org.persapiens.improve.service;

import java.util.Collection;
import java.util.List;
import lombok.Getter;
import org.persapiens.improve.domain.Recommendation;
import org.persapiens.improve.domain.RecommendationFeedback;
import org.persapiens.improve.domain.User;
import org.persapiens.improve.persistence.RecommendationFeedbackRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecommendationFeedbackService extends RepositoryCrudService<RecommendationFeedback, Long> {

	@Getter
	@Autowired
	private RecommendationFeedbackRepository repository;

	@Autowired
	private RecommendationService recommendationService;

	@Autowired
	private UserService userService;

	private List<RecommendationFeedback> fill(List<RecommendationFeedback> result) {
		for (RecommendationFeedback bean : result) {
			bean.setRecommendation(recommendationService.findById(bean.getRecommendation().getId()).get());
			bean.setUser(userService.findById(bean.getUser().getId()).get());
		}

		return result;
	}

	public List<RecommendationFeedback> findByUser(User user) {
		return fill(repository.findByUser(user));
	}

	public List<RecommendationFeedback> findByRecommendationInAndUser(Collection<Recommendation> recommendation,
			User user) {
		return fill(repository.findByRecommendationInAndUser(recommendation, user));
	}

	@Override
	public void save(RecommendationFeedback bean) {
		if (bean.getId() == null) {
			bean.insert();
		}
		else {
			bean.update();
		}

		super.save(bean);
	}

}
