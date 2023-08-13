package org.persapiens.improve.view.crud;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.faces.view.ViewScoped;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
import lombok.extern.slf4j.Slf4j;
import org.persapiens.improve.domain.ChallengeFeedback;
import org.persapiens.improve.domain.IdBean;
import org.persapiens.improve.domain.Recommendation;
import org.persapiens.improve.domain.RecommendationFeedback;
import org.persapiens.improve.view.bean.UserMBean;
import org.primefaces.event.ItemSelectEvent;
import org.primefaces.model.charts.ChartData;
import org.primefaces.model.charts.optionconfig.legend.Legend;
import org.primefaces.model.charts.optionconfig.legend.LegendLabel;
import org.primefaces.model.charts.pie.PieChartDataSet;
import org.primefaces.model.charts.pie.PieChartModel;
import org.primefaces.model.charts.pie.PieChartOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@ViewScoped
@Component
public abstract class AbstractFeedbackSummaryCrudMBean<T extends IdBean<Long>> extends CrudMBean<T, Long> {

    private static final long serialVersionUID = 1L;

    private int selectedIndex = 0;
    
    private PieChartModel pieModel;
    
    private List<List<T>> lists;

    @Autowired
    protected UserMBean userMBean;

    @SuppressFBWarnings("EI_EXPOSE_REP")
    public PieChartModel getPieModel() {
        if (pieModel == null) {
            pieModel = createPieModel();
        }
        return pieModel;
    }
    
    public void pieListener(ItemSelectEvent e){
        selectedIndex = e.getItemIndex();
        findAction();
    }

    public String getCrudTitleColor() {
        return backgroundColors().get(selectedIndex);
    }
    
    public String getCrudTitleText() {
        return crudTitleTexts().get(selectedIndex);
    }
    
    private List<Number> values() {
        List<Number> result = new ArrayList<>();
        for(List<T> list : feedbackLists()) {
            result.add(list.size());
        }
        return result;
    }

    @Override
    public List<T> find() {
        if (lists == null) {
            lists = feedbackLists();
        }
        return lists.get(selectedIndex);
    }
    
    protected abstract List<String> backgroundColors();
    
    protected abstract List<String> crudTitleTexts();
    
    protected abstract List<List<T>> feedbackLists();
    
    protected abstract List<String> labels();
    
    private PieChartModel createPieModel() {
        PieChartModel result = new PieChartModel();
        ChartData data = new ChartData();

        PieChartDataSet dataSet = new PieChartDataSet();
        dataSet.setData(values());

        dataSet.setBackgroundColor(backgroundColors());

        data.addChartDataSet(dataSet);
        data.setLabels(labels());

        result.setData(data);
        
        PieChartOptions options = new PieChartOptions();
        Legend legend = new Legend();
        legend.setDisplay(true);
        legend.setPosition("top");
        LegendLabel legendLabels = new LegendLabel();
        legend.setLabels(legendLabels);
        options.setLegend(legend);
        result.setOptions(options);
        
        result.setExtender("chartExtender");
        
        return result;
    }

    protected List<ChallengeFeedback> sortChallengeFeedback(List<ChallengeFeedback> list) {
        Comparator<ChallengeFeedback> comparator = (ChallengeFeedback o1, ChallengeFeedback o2) -> 
            o2.getChallenge().getChallengeInterviews().size() - 
                o1.getChallenge().getChallengeInterviews().size();
        Collections.sort(list, comparator);
        
        return list;
    }

    protected List<RecommendationFeedback> sortRecommendationFeedback(List<RecommendationFeedback> list) {
        Comparator<RecommendationFeedback> comparator = (RecommendationFeedback o1, RecommendationFeedback o2) -> 
            o2.getRecommendation().getRecommendationInterviews().size() - 
                o1.getRecommendation().getRecommendationInterviews().size();
        Collections.sort(list, comparator);
        
        return list;
    }
    
    protected List<RecommendationFeedback> recommendationFeedbackList(Collection<Recommendation> recommendations,   
            List<RecommendationFeedback> recommendationFeedbackList) {
        List<RecommendationFeedback> result = new ArrayList<>();
        Map<Recommendation, RecommendationFeedback> recommendationRecommendationFeedbackMap = 
            recommendationFeedbackList.stream().collect(Collectors.toMap(RecommendationFeedback::getRecommendation, Function.identity()));
        for(Recommendation bean : recommendations) {
            RecommendationFeedback cf = recommendationRecommendationFeedbackMap.get(bean);
            if (cf == null) {
                cf = RecommendationFeedback.builder()
                    .recommendation(bean)
                    .user(userMBean.getLoggedUser())
                    .build();
            }
            result.add(cf);
        }
        
        return sortRecommendationFeedback(result);
    }
    
}
