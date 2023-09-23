package org.persapiens.improve.view.crud;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.faces.view.ViewScoped;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.persapiens.improve.domain.Challenge;
import org.persapiens.improve.domain.ChallengeFeedback;
import org.persapiens.improve.domain.Recommendation;
import org.persapiens.improve.domain.RecommendationFeedback;
import org.persapiens.improve.service.ChallengeFeedbackService;
import org.persapiens.improve.service.RecommendationFeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@ViewScoped
@Component
public class RecommendationFeedbackSummaryCrudMBean extends AbstractFeedbackSummaryCrudMBean<RecommendationFeedback> {

	private static final long serialVersionUID = 1L;

	@SuppressFBWarnings("SE_BAD_FIELD")
	@Autowired
	private RecommendationFeedbackService recommendationFeedbackService;

	@SuppressFBWarnings("SE_BAD_FIELD")
	@Autowired
	private ChallengeFeedbackService challengeFeedbackService;

	@Getter
	private List<ChallengeFeedback> challengeFeedbackConflictList;

	@Getter
	private List<RecommendationFeedback> recommendationFeedbackConflictList;

	@Getter
	private List<ChallengeFeedback> challengeFeedbackLinkList;

	@Override
	protected RecommendationFeedback createBean() {
		return RecommendationFeedback.builder().build();
	}

	@Override
	protected List<List<RecommendationFeedback>> feedbackLists() {
		List<RecommendationFeedback> notUsedAndWillUseList = new ArrayList<>();
		List<RecommendationFeedback> usedAlreadyList = new ArrayList<>();
		List<RecommendationFeedback> notUsedAndNotWillUseList = new ArrayList<>();

		for (RecommendationFeedback rf : recommendationFeedbackService.findByUser(userMBean.getLoggedUser())) {
			if (Objects.nonNull(rf.getUsedAlready())) {
				if (rf.getUsedAlready()) {
					usedAlreadyList.add(rf);
				}
				else if (Objects.nonNull(rf.getWillUse())) {
					if (rf.getWillUse()) {
						notUsedAndWillUseList.add(rf);
					}
					else {
						notUsedAndNotWillUseList.add(rf);
					}
				}
			}
		}

		notUsedAndWillUseList = sortRecommendationFeedback(notUsedAndWillUseList);
		usedAlreadyList = sortRecommendationFeedback(usedAlreadyList);
		notUsedAndNotWillUseList = sortRecommendationFeedback(notUsedAndNotWillUseList);

		return Arrays.asList(notUsedAndWillUseList, usedAlreadyList, notUsedAndNotWillUseList);
	}

	@Override
	protected List<String> backgroundColors() {
		return Arrays.asList("limegreen", "dodgerblue", "grey");
	}

	@Override
	protected List<String> labels() {
		return Arrays.asList("Not used and will use", "Used", "Not used and won't use");
	}

	@Override
	protected List<String> crudTitleTexts() {
		return Arrays.asList("Recommendations that you should apply to your course.",
				"Recommendations that you already use in your course.",
				"Recommendations that you won't use in your course.");
	}

	@Override
	public void startDetailAction() {
		super.startDetailAction();

		List<Challenge> challengeConflictList = getBean().getRecommendation()
			.getChallengeConflicts()
			.stream()
			.map(cc -> cc.getChallenge())
			.toList();
		challengeFeedbackConflictList = challengeFeedbackService.findByChallengeInAndUser(challengeConflictList,
				userMBean.getLoggedUser());
		challengeFeedbackConflictList = challengeFeedbackList(challengeConflictList, challengeFeedbackConflictList);

		List<Challenge> challengeLinkList = getBean().getRecommendation()
			.getLinks()
			.stream()
			.map(cc -> cc.getChallenge())
			.toList();
		challengeFeedbackLinkList = challengeFeedbackService.findByChallengeInAndUser(challengeLinkList,
				userMBean.getLoggedUser());
		challengeFeedbackLinkList = challengeFeedbackList(challengeLinkList, challengeFeedbackLinkList);

		Set<Recommendation> recommendationConflictList = getBean().getRecommendation().getRecommendationConflicts();
		recommendationFeedbackConflictList = recommendationFeedbackService
			.findByRecommendationInAndUser(recommendationConflictList, userMBean.getLoggedUser());
		recommendationFeedbackConflictList = recommendationFeedbackList(recommendationConflictList,
				recommendationFeedbackConflictList);
	}

	protected List<ChallengeFeedback> challengeFeedbackList(Collection<Challenge> challenges,
			List<ChallengeFeedback> challengeFeedbackList) {
		List<ChallengeFeedback> result = new ArrayList<>();
		Map<Challenge, ChallengeFeedback> challengeChallengeFeedbackMap = challengeFeedbackList.stream()
			.collect(Collectors.toMap(ChallengeFeedback::getChallenge, Function.identity()));
		for (Challenge bean : challenges) {
			ChallengeFeedback cf = challengeChallengeFeedbackMap.get(bean);
			if (cf == null) {
				cf = ChallengeFeedback.builder().challenge(bean).user(userMBean.getLoggedUser()).build();
			}
			result.add(cf);
		}
		return sortChallengeFeedback(result);
	}

}
