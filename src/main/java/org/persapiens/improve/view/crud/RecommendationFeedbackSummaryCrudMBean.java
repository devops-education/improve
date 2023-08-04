package org.persapiens.improve.view.crud;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.faces.view.ViewScoped;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import lombok.extern.slf4j.Slf4j;
import org.persapiens.improve.domain.RecommendationFeedback;
import org.persapiens.improve.persistence.RecommendationFeedbackRepository;
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
public class RecommendationFeedbackSummaryCrudMBean extends CrudMBean<RecommendationFeedback, Long> {

    private static final long serialVersionUID = 1L;

    private PieChartModel pieModel;
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private RecommendationFeedbackRepository recommendationFeedbackRepository;
    
    @Override
    public List<RecommendationFeedback> find() {
        return recommendationFeedbackRepository.findByUsernameAndUsedAlreadyIsFalseAndWillUseIsTrueOrderByKnownAsc(username());
    }

    @Override
    protected RecommendationFeedback createBean() {
        return RecommendationFeedback.builder().build();
    }

    @Override
    protected RecommendationFeedback getDetailBean(RecommendationFeedback bean) {
        return recommendationFeedbackRepository.findDetailById(bean.getId()).get(); 
    }
    
    public PieChartModel getPieModel() {
        if (pieModel == null) {
            pieModel = createPieModel();
        }
        return pieModel;
    }

    private List<Number> values() {
        List<RecommendationFeedback> feedbacks = recommendationFeedbackRepository.findByUsername(username());
        
        Number usedAlreadyCount = feedbacks.stream().filter(RecommendationFeedback::getUsedAlready).count();
        Number notUsedAndWillUseCount = feedbacks.stream().filter(rf -> !rf.getUsedAlready() && rf.getWillUse()).count();
        Number notUsedAndNotWillUseCount = feedbacks.stream().filter( rf -> !rf.getUsedAlready() && !rf.getWillUse()).count();
        return Arrays.asList(usedAlreadyCount, notUsedAndWillUseCount, notUsedAndNotWillUseCount);
    }
    
    private PieChartModel createPieModel() {
        PieChartModel result = new PieChartModel();
        ChartData data = new ChartData();

        PieChartDataSet dataSet = new PieChartDataSet();
        dataSet.setData(values());

        List<String> bgColors = new ArrayList<>();
        bgColors.add("green");
        bgColors.add("blue");
        bgColors.add("orange");
        dataSet.setBackgroundColor(bgColors);

        data.addChartDataSet(dataSet);
        List<String> labels = new ArrayList<>();
        labels.add("Green - Used");
        labels.add("Blue - Not used and Will use");
        labels.add("Orange - Not used and won't use");
        data.setLabels(labels);

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
}
