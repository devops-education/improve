package org.persapiens.improve.view.crud;

import jakarta.faces.view.ViewScoped;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.apache.lucene.queryparser.classic.ParseException;
import org.persapiens.improve.domain.Challenge;
import org.persapiens.improve.domain.ChallengeFeedback;
import org.persapiens.improve.domain.IdBean;
import org.persapiens.improve.domain.Recommendation;
import org.persapiens.improve.domain.RecommendationFeedback;
import org.persapiens.improve.domain.TeachingMethod;
import org.persapiens.improve.domain.TeachingMethodFeedback;
import org.persapiens.improve.domain.TeachingMethodLink;
import org.persapiens.improve.domain.Theme;
import org.persapiens.improve.service.RecommendationFeedbackService;
import org.persapiens.improve.service.ChallengeFeedbackService;
import org.persapiens.improve.service.TeachingMethodFeedbackService;
import org.persapiens.improve.view.bean.UserMBean;
import org.primefaces.util.LangUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@ViewScoped
@Component
public abstract class AbstractFeedbackCrudMBean<T extends IdBean<Long>> extends CrudMBean<T, Long> {

	private static final long serialVersionUID = 1L;

	@Autowired
	protected ChallengeFeedbackService challengeFeedbackService;

	@Autowired
	protected RecommendationFeedbackService recommendationFeedbackService;

	@Autowired
	private TeachingMethodFeedbackService teachingMethodFeedbackService;

	@Autowired
	protected UserMBean userMBean;

	@Getter
	@Setter
	private List<TeachingMethodLinksTeachingMethodFeedback> teachingMethodLinksTeachingMethodFeedbackList;

	@Getter
	@Setter
	private boolean assessmentFilter;

	@Getter
	@Setter
	private boolean classPreparationFilter;

	@Getter
	@Setter
	private boolean curriculumFilter;

	@Getter
	@Setter
	private boolean environmentSetupFilter;

	@Getter
	@Setter
	private boolean devopsConceptsFilter;

	@Getter
	@Setter
	private boolean strategiesInCourseExecutionFilter;

	@Getter
	@Setter
	private boolean toolTechnologyFilter;

	@Override
	public boolean isCheckStartUpdate(T bean) {
		return true;
	}

	public boolean globalFilterFunction(T value, Object filter, Locale locale) {
		boolean result = false;
		try {
			String filterText = (filter == null) ? null : filter.toString().trim().toLowerCase();
			if (LangUtils.isBlank(filterText)) {
				return true;
			}
			else {
				result = doGlobalFilterFunction(value, filterText, locale);
			}
		}
		catch (ParseException | IOException ex) {
			result = false;
		}
		return result;
	}

	protected abstract boolean doGlobalFilterFunction(T value, String filter, Locale locale)
			throws ParseException, IOException;

	public void saveRecommendationFeedbackUsedAlready(RecommendationFeedback recommendationFeedback) {
		saveRecommendationFeedback(recommendationFeedback);
	}

	public void saveRecommendationFeedbackWillUse(RecommendationFeedback recommendationFeedback) {
		saveRecommendationFeedback(recommendationFeedback);
	}

	public void saveRecommendationFeedback(RecommendationFeedback recommendationFeedback) {
		recommendationFeedbackService.save(recommendationFeedback);
	}

	public void saveTeachingMethodFeedbackUsedAlready(TeachingMethodFeedback teachingMethodFeedback) {
		saveTeachingMethodFeedback(teachingMethodFeedback);
	}

	public void saveTeachingMethodFeedbackWillUse(TeachingMethodFeedback teachingMethodFeedback) {
		saveTeachingMethodFeedback(teachingMethodFeedback);
	}

	public void saveTeachingMethodFeedback(TeachingMethodFeedback teachingMethodFeedback) {
		teachingMethodFeedbackService.save(teachingMethodFeedback);
	}

	public void saveChallengeFeedback(ChallengeFeedback challengeFeedback) {
		challengeFeedbackService.save(challengeFeedback);
	}

	public void saveChallengeFeedbackWillMitigate(ChallengeFeedback challengeFeedback) {
		saveChallengeFeedback(challengeFeedback);
	}

	protected RecommendationFeedback recommendationFeedback(Recommendation recommendation,
			Map<Recommendation, RecommendationFeedback> recommendationRecommendationFeedbackMap) {
		RecommendationFeedback result = recommendationRecommendationFeedbackMap.get(recommendation);
		if (result == null) {
			result = RecommendationFeedback.builder()
				.recommendation(recommendation)
				.user(userMBean.getLoggedUser())
				.build();
		}
		return result;
	}

	protected ChallengeFeedback challengeFeedback(Challenge challenge,
			Map<Challenge, ChallengeFeedback> challengeChallengeFeedbackMap) {
		ChallengeFeedback result = challengeChallengeFeedbackMap.get(challenge);
		if (result == null) {
			result = ChallengeFeedback.builder().challenge(challenge).user(userMBean.getLoggedUser()).build();
		}
		return result;
	}

	protected TeachingMethodFeedback teachingMethodFeedback(TeachingMethod teachingMethod,
			Map<TeachingMethod, TeachingMethodFeedback> teachingMethodTeachingMethodFeedbackMap) {
		TeachingMethodFeedback result = teachingMethodTeachingMethodFeedbackMap.get(teachingMethod);
		if (result == null) {
			result = TeachingMethodFeedback.builder()
				.teachingMethod(teachingMethod)
				.user(userMBean.getLoggedUser())
				.build();
		}
		return result;
	}

	protected Map<TeachingMethod, TeachingMethodFeedback> teachingMethodTeachingMethodFeedbackMap(
			Set<TeachingMethodLink> teachingMethodLinks) {
		Set<TeachingMethod> teachingMethods = teachingMethodLinks.stream()
			.map(TeachingMethodLink::getTeachingMethod)
			.collect(Collectors.toSet());

		// recuperando os teaching method feedback dos links do desafio
		return teachingMethodFeedbackService.findByTeachingMethodInAndUser(teachingMethods, userMBean.getLoggedUser())
			.stream()
			.collect(Collectors.toMap(TeachingMethodFeedback::getTeachingMethod, Function.identity()));
	}

	protected TeachingMethodLinksTeachingMethodFeedback teachingMethodLinkTeachingMethodFeedback(
			TeachingMethodFeedback teachingMethodFeedback,
			List<TeachingMethodLinksTeachingMethodFeedback> newTeachingMethodLinkTeachingMethodFeedbackList) {
		TeachingMethodLinksTeachingMethodFeedback result = null;
		for (TeachingMethodLinksTeachingMethodFeedback bean : newTeachingMethodLinkTeachingMethodFeedbackList) {
			if (bean.getTeachingMethodFeedback().equals(teachingMethodFeedback)) {
				result = bean;
				break;
			}
		}

		if (result == null) {
			result = TeachingMethodLinksTeachingMethodFeedback.builder()
				.teachingMethodFeedback(teachingMethodFeedback)
				.teachingMethodLinks(new ArrayList<>())
				.build();
			newTeachingMethodLinkTeachingMethodFeedbackList.add(result);
		}

		return result;
	}

	protected void createTeachingMethodFeedbackLists(Set<TeachingMethodLink> teachingMethodLinks) {
		Map<TeachingMethod, TeachingMethodFeedback> teachingMethodTeachingMethodFeedbackMap = teachingMethodTeachingMethodFeedbackMap(
				teachingMethodLinks);

		List<TeachingMethodLinksTeachingMethodFeedback> newTeachingMethodLinkTeachingMethodFeedbackList = new ArrayList<>();
		// varrendo os teaching method links
		for (TeachingMethodLink link : teachingMethodLinks) {
			TeachingMethod teachingMethod = link.getTeachingMethod();
			TeachingMethodFeedback teachingMethodFeedback = teachingMethodFeedback(teachingMethod,
					teachingMethodTeachingMethodFeedbackMap);

			TeachingMethodLinksTeachingMethodFeedback teachingMethodLinkTeachingMethodFeedback = teachingMethodLinkTeachingMethodFeedback(
					teachingMethodFeedback, newTeachingMethodLinkTeachingMethodFeedbackList);
			teachingMethodLinkTeachingMethodFeedback.getTeachingMethodLinks().add(link);
		}
		setTeachingMethodLinksTeachingMethodFeedbackList(newTeachingMethodLinkTeachingMethodFeedbackList);
	}

	protected Set<Theme> themeFilter() {
		Set<Theme> result = new HashSet<>();
		if (assessmentFilter) {
			result.add(Theme.ASSESSMENT);
		}
		if (classPreparationFilter) {
			result.add(Theme.CLASS_PREPARATION);
		}
		if (curriculumFilter) {
			result.add(Theme.CURRICULUM);
		}
		if (devopsConceptsFilter) {
			result.add(Theme.DEVOPS_CONCEPTS);
		}
		if (environmentSetupFilter) {
			result.add(Theme.ENVIRONMENT_SETUP);
		}
		if (strategiesInCourseExecutionFilter) {
			result.add(Theme.STRATEGIES_IN_COURSE_EXECUTION);
		}
		if (toolTechnologyFilter) {
			result.add(Theme.TOOL_TECHNOLOGY);
		}
		return result;
	}

	public void themeFilterAction() {
		findAction();
	}

}
