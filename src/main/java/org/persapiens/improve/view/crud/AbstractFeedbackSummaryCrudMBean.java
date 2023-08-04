package org.persapiens.improve.view.crud;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.faces.view.ViewScoped;
import java.util.ArrayList;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.primefaces.model.charts.ChartData;
import org.primefaces.model.charts.optionconfig.legend.Legend;
import org.primefaces.model.charts.optionconfig.legend.LegendLabel;
import org.primefaces.model.charts.pie.PieChartDataSet;
import org.primefaces.model.charts.pie.PieChartModel;
import org.primefaces.model.charts.pie.PieChartOptions;
import org.springframework.stereotype.Component;

@Slf4j
@ViewScoped
@Component
public abstract class AbstractFeedbackSummaryCrudMBean<T extends Object> extends CrudMBean<T, Long> {

    private static final long serialVersionUID = 1L;

    private PieChartModel pieModel;

    @SuppressFBWarnings("EI_EXPOSE_REP")
    public PieChartModel getPieModel() {
        if (pieModel == null) {
            pieModel = createPieModel();
        }
        return pieModel;
    }

    protected abstract List<Number> values();
    
    protected abstract List<String> backgourndColors();
    
    protected abstract List<String> labels();
    
    private PieChartModel createPieModel() {
        PieChartModel result = new PieChartModel();
        ChartData data = new ChartData();

        PieChartDataSet dataSet = new PieChartDataSet();
        dataSet.setData(values());

        dataSet.setBackgroundColor(backgourndColors());

        data.addChartDataSet(dataSet);
        List<String> labels = new ArrayList<>();
        labels.add("No mitigation");
        labels.add("Will mitigate with links");
        labels.add("Will mitigate with no links");
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
