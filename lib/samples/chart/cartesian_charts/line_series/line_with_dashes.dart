/// Package imports
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Local import
import '../../../../model/sample_view.dart';

class LineDashed extends SampleView {
  const LineDashed(Key key)
      : super(key: key);

  @override
  _LineDashedState createState() => _LineDashedState();
}

class _LineDashedState extends SampleViewState {
  _LineDashedState();  

  @override
  Widget build(BuildContext context) {
    return getDashedLineChart();
  }

  SfCartesianChart getDashedLineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: isCardView ? '' : 'Capital investment as a share of exports'),
      legend: Legend(
          isVisible: isCardView ? false : true,
          overflowMode: LegendItemOverflowMode.wrap),
      primaryXAxis: NumericAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          majorGridLines: MajorGridLines(width: 0),
          interval: 2),
      primaryYAxis: NumericAxis(
          minimum: 3,
          maximum: 21,
          interval: isCardView ? 6 : 3,
          labelFormat: '{value}%',
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(color: Colors.transparent)),
      series: getDashedLineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// The method returns line series to chart.
  List<LineSeries<_ChartData, num>> getDashedLineSeries() {
    final List<_ChartData> chartData = <_ChartData>[
      _ChartData(2010, 6.6, 9.0, 15.1, 18.8),
      _ChartData(2011, 6.3, 9.3, 15.5, 18.5),
      _ChartData(2012, 6.7, 10.2, 14.5, 17.6),
      _ChartData(2013, 6.7, 10.2, 13.9, 16.1),
      _ChartData(2014, 6.4, 10.9, 13, 17.2),
      _ChartData(2015, 6.8, 9.3, 13.4, 18.9),
      _ChartData(2016, 7.7, 10.1, 14.2, 19.4),
    ];
    return <LineSeries<_ChartData, num>>[
      LineSeries<_ChartData, num>(
          animationDuration: 2500,
          enableTooltip: true,
          /// The property uses to render a line with dashes.
          dashArray: kIsWeb ? <double>[0, 0] : <double>[15, 3, 3, 3],
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          width: 2,
          name: 'Singapore',
          markerSettings: MarkerSettings(isVisible: true)),
      LineSeries<_ChartData, num>(
          animationDuration: 2500,
          enableTooltip: true,
          dataSource: chartData,
          dashArray: kIsWeb ? <double>[0, 0] : <double>[15, 3, 3, 3],
          width: 2,
          name: 'Saudi Arabia',
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y2,
          markerSettings: MarkerSettings(isVisible: true)),
      LineSeries<_ChartData, num>(
          animationDuration: 2500,
          enableTooltip: true,
          dataSource: chartData,
          width: 2,
          dashArray: kIsWeb ? <double>[0, 0] : <double>[15, 3, 3, 3],
          name: 'Spain',
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y3,
          markerSettings: MarkerSettings(isVisible: true)),
      LineSeries<_ChartData, num>(
          animationDuration: 2500,
          enableTooltip: true,
          dataSource: chartData,
          width: 2,
          dashArray: kIsWeb ? <double>[0, 0] : <double>[15, 3, 3, 3],
          name: 'Portugal',
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y4,
          markerSettings: MarkerSettings(isVisible: true)),
    ];
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.y2, this.y3, this.y4);
  final double x;
  final double y;
  final double y2;
  final double y3;
  final double y4;
}
