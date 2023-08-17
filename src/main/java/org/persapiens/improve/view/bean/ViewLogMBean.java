package org.persapiens.improve.view.bean;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.faces.view.ViewScoped;
import org.persapiens.improve.domain.Challenge;
import org.persapiens.improve.domain.Recommendation;
import org.persapiens.improve.domain.ViewLog;
import org.persapiens.improve.domain.ViewLogType;
import org.persapiens.improve.service.ViewLogService;
import org.persapiens.improve.view.AbstractMBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@ViewScoped
@Component
public class ViewLogMBean extends AbstractMBean {

    private static final long serialVersionUID = 1L;

    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private ViewLogService viewLogService;

    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private UserMBean userMBean;

    private void saveViewLog(ViewLog viewLog) {
        viewLogService.save(viewLog);
    }

    private void saveViewLogType(ViewLogType viewLogType) {
        saveViewLogType(viewLogType, "");
    }

    private void saveViewLogType(ViewLogType viewLogType, String description) {
        saveViewLog(ViewLog.builder()
            .user(userMBean.getLoggedUser())
            .type(viewLogType)
            .description(description)
            .build());
    }

    public void logLogin() {
        saveViewLogType(ViewLogType.LOGIN);
    }

    public void logHome() {
        saveViewLogType(ViewLogType.HOME);
    }

    public void logChallenge() {
        saveViewLogType(ViewLogType.CHALLENGE);
    }

    public void logRecommendation() {
        saveViewLogType(ViewLogType.RECOMMENDATION);
    }

    public void logSummary() {
        saveViewLogType(ViewLogType.SUMMARY);
    }

    public void logUser() {
        saveViewLogType(ViewLogType.USER);
    }

    public void logLogout() {
        saveViewLogType(ViewLogType.LOGOUT);
    }

    public void logChallengeDetail(Challenge bean) {
        saveViewLogType(ViewLogType.CHALLENGE_DETAIL, bean.getId().toString());
    }

    public void logRecommendationDetail(Recommendation bean) {
        saveViewLogType(ViewLogType.RECOMMENDATION_DETAIL, bean.getId().toString());
    }

}
