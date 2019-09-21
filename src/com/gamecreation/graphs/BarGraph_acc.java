package com.gamecreation.graphs;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.GradientPaint;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;

public class BarGraph_acc extends javax.swing.JFrame {

    public BarGraph_acc(/*double[] Exsys,*/double[] ProSys) {
        setTitle("Accuracy Graph");
        CategoryDataset dataset;
        //  for (int i = 0; i < 10; i++) {
        dataset = createDataset(/*Exsys,*/ProSys);
        // }

        JFreeChart chart = createChart(dataset);
        ChartPanel chartPanel = new ChartPanel(chart);
        chartPanel.setPreferredSize(new Dimension(600, 370));
        setContentPane(chartPanel);

//        FrmRatingBased.MAEGraph.removeAll();
//        FrmRatingBased.MAEGraph.add(chartPanel);
//        FrmRatingBased.MAEGraph.updateUI();
//        FrmRatingBased.MAEGraph.setVisible(true);
    }

    private CategoryDataset createDataset(/*double[] Exsys,*/double[] ProSys) {
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        //for (int i = 0; i < ProSys.length; i++) {
//            dataset.addValue(Exsys[i], "ExCl_" + (i + 1), "");

        dataset.addValue(ProSys[0], "SVM", "");
        dataset.addValue(ProSys[1], "Naive Bayes", "");
//        dataset.addValue(ProSys[2], "Top_8", "");
//        dataset.addValue(ProSys[3], "Top_10", "");
        //}
//        dataset.addValue(100, "Expert", "");
//        dataset.addValue(Rtreecount[0], "ExC_1", "");
//
//        dataset.addValue(Rplustreecount[0], "Proposed system", "");
//        dataset.addValue(100, "Expert", "");
//        dataset.addValue(90, "ExC_1", "");
//        dataset.addValue(80, "d", "");
//        dataset.addValue(80, "ExC_1", "");
        return dataset;
    }

    private JFreeChart createChart(final CategoryDataset dataset) {

        // create the chart...
        final JFreeChart chart = ChartFactory.createBarChart(
                "", // chart title
                "Summary", // domain axis label
                "Accuracy (percentage)", // range axis label
                dataset, // data
                PlotOrientation.VERTICAL, // orientation
                true, // include legend
                true, // tooltips
                false // urls
        );

        chart.setBackgroundPaint(Color.white);

        // get a reference to the plot for further customisation...
        final CategoryPlot plot = chart.getCategoryPlot();
        plot.setBackgroundPaint(Color.lightGray);
        plot.setDomainGridlinePaint(Color.white);
        plot.setRangeGridlinePaint(Color.white);

        // set the range axis to display integers only...
        final NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
        rangeAxis.setStandardTickUnits(NumberAxis.createStandardTickUnits());

        // disable bar outlines...
        final BarRenderer renderer = (BarRenderer) plot.getRenderer();
        renderer.setDrawBarOutline(false);

        // set up gradient paints for series...
//        for (int i = 0; i < 6; i++) {
//
        final GradientPaint gp0 = new GradientPaint(
                0.0f, 0.0f, Color.green,
                0.0f, 0.0f, Color.green
        );
//            renderer.setSeriesPaint(0, gp0);
//        }

        final GradientPaint gp1 = new GradientPaint(
                0.0f, 0.0f, Color.blue,
                0.0f, 0.0f, Color.blue
        );

        final GradientPaint gp2 = new GradientPaint(
                0.0f, 0.0f, Color.cyan,
                0.0f, 0.0f, Color.cyan
        );
        final GradientPaint gp3 = new GradientPaint(
                0.0f, 0.0f, Color.red,
                0.0f, 0.0f, Color.red
        );
//        final GradientPaint gp4 = new GradientPaint(
//                0.0f, 0.0f, Color.GREEN,
//                0.0f, 0.0f, Color.lightGray
//        );
//        final GradientPaint gp5 = new GradientPaint(
//                0.0f, 0.0f, Color.BLUE,
//                0.0f, 0.0f, Color.lightGray
//        );
//        final GradientPaint gp6 = new GradientPaint(
//                0.0f, 0.0f, Color.cyan,
//                0.0f, 0.0f, Color.lightGray
//        );
//        final GradientPaint gp7 = new GradientPaint(
//                0.0f, 0.0f, Color.red,
//                0.0f, 0.0f, Color.lightGray
//        );
        final GradientPaint gp8 = new GradientPaint(
                0.0f, 0.0f, Color.YELLOW,
                0.0f, 0.0f, Color.lightGray
        );

        renderer.setSeriesPaint(0, gp0);
        renderer.setSeriesPaint(1, gp1);
        renderer.setSeriesPaint(2, gp2);
        renderer.setSeriesPaint(3, gp3);
        renderer.setSeriesPaint(4, gp8);
//        renderer.setSeriesPaint(4, gp4);
//        renderer.setSeriesPaint(5, gp5);
//        renderer.setSeriesPaint(6, gp6);
//        renderer.setSeriesPaint(7, gp7);
        final CategoryAxis domainAxis = plot.getDomainAxis();
        domainAxis.setCategoryLabelPositions(
                CategoryLabelPositions.createUpRotationLabelPositions(Math.PI / 6.0)
        );
        // OPTIONAL CUSTOMISATION COMPLETED.

        return chart;
    }
    public static double[] exsys = new double[4];
    double[] prsys = new double[4];

    public static void main(String args[]) {

        double[] exsys = {50.0, 60.0, 70.0, 60.0};
        double[] prsys = {70.0, 50.0};

        BarGraph_acc cg = new BarGraph_acc(prsys);
        cg.pack();
        cg.setVisible(true);

    }

}
