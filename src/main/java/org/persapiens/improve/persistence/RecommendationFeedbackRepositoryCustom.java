package org.persapiens.improve.persistence;

import java.util.List;
import java.util.Optional;
import org.persapiens.improve.domain.RecommendationFeedback;

public interface RecommendationFeedbackRepositoryCustom {
    List<RecommendationFeedback> findByUsernameLeftJoinRecommendationLinks(String username);
    Optional<RecommendationFeedback> findDetailById(Long id);
}
