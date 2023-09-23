package org.persapiens.improve.service;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import lombok.Getter;
import org.persapiens.improve.domain.Challenge;
import org.persapiens.improve.domain.ChallengeInterview;
import org.persapiens.improve.domain.ChallengeRecommendationConflict;
import org.persapiens.improve.domain.ChallengeTag;
import org.persapiens.improve.domain.Link;
import org.persapiens.improve.domain.TeachingMethodLink;
import org.persapiens.improve.persistence.ChallengeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChallengeService extends InMemoryCrudService<Challenge, Long> {

	@Getter
	@Autowired
	private ChallengeRepository repository;

	@Autowired
	private ChallengeTagService challengeTagService;

	@Autowired
	private ChallengeInterviewService challengeInterviewService;

	@Autowired
	private LinkService linkService;

	@Autowired
	private ChallengeRecommendationConflictService challengeRecommendationConflictService;

	@Autowired
	private TagService tagService;

	@Autowired
	private InterviewService interviewService;

	private RecommendationService recommendationService;

	@Autowired
	private TeachingMethodLinkService teachingMethodLinkService;

	@Autowired
	private TeachingMethodService teachingMethodService;

	@SuppressFBWarnings("EI_EXPOSE_REP2")
	@Autowired
	public void setRecommendationService(RecommendationService recommendationService) {
		this.recommendationService = recommendationService;
	}

	@Override
	public void init() {
		recommendationService.setChallengeService(this);

		super.init();
	}

	@Override
	protected Challenge fill(Challenge result) {
		result = super.fill(result);

		result = fillChallengeTags(result);

		result = fillChallengeInterviews(result);

		result = fillLinks(result);

		result = fillConflicts(result);

		return result;
	}

	private Challenge fillChallengeTags(Challenge result) {
		result.setChallengeTags(challengeTagService.findByChallenge(result));
		for (ChallengeTag bean : result.getChallengeTags()) {
			bean.setChallenge(result);
			bean.setTag(tagService.findById(bean.getTag().getId()).get());
		}

		return result;
	}

	private Challenge fillChallengeInterviews(Challenge result) {
		result.setChallengeInterviews(challengeInterviewService.findByChallenge(result));
		for (ChallengeInterview bean : result.getChallengeInterviews()) {
			bean.setChallenge(result);
			bean.setInterview(interviewService.findById(bean.getInterview().getId()).get());
		}

		return result;
	}

	private Challenge fillLinks(Challenge result) {
		result.setLinks(linkService.findByChallenge(result));
		for (Link bean : result.getLinks()) {
			bean.setChallenge(result);
			bean.setRecommendation(recommendationService.findById(bean.getRecommendation().getId()).get());

			bean.setTeachingMethodLinks(teachingMethodLinkService.findByLink(bean));
			for (TeachingMethodLink teachingMethodLink : bean.getTeachingMethodLinks()) {
				teachingMethodLink.setLink(bean);
				teachingMethodLink.setTeachingMethod(
						teachingMethodService.findById(teachingMethodLink.getTeachingMethod().getId()).get());
			}
		}

		return result;
	}

	private Challenge fillConflicts(Challenge result) {
		result.setConflicts(challengeRecommendationConflictService.findByChallenge(result));
		for (ChallengeRecommendationConflict bean : result.getConflicts()) {
			bean.setChallenge(result);
			bean.setRecommendation(recommendationService.findById(bean.getRecommendation().getId()).get());
		}

		return result;
	}

	public List<Challenge> findByOrderByChallengeInterviewsSizeDesc() {
		List<Challenge> result = new ArrayList<>(getBeans().values());
		Collections.sort(result, (Challenge o1, Challenge o2) -> o2.getChallengeInterviews().size()
				- o1.getChallengeInterviews().size());
		return result;
	}

}
