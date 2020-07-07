/// Package imports
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Local imports
import '../../../../model/model.dart';
import '../../../../model/sample_view.dart';
import '../../../../widgets/customDropDown.dart';

/// Renders the spline types cahrt sample.
class SplineTypes extends SampleView {
  const SplineTypes(Key key) : super(key: key);

  @override
  _SplineTypesState createState() => _SplineTypesState();
}

/// State class for spline types chart.
class _SplineTypesState extends SampleViewState {
  _SplineTypesState();

  final List<String> _splineList =
      <String>['natural', 'monotonic', 'cardinal', 'clamped'].toList();
  String _selectedSplineType = 'natural';
  SplineType _spline = SplineType.natural;

  @override
  void initState() {
    _selectedSplineType = 'natural';
    _spline = SplineType.natural;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getTypesSplineChart();
  }

  @override
  Widget buildSettings(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Text('Spline type ',
                  style: TextStyle(
                      color: model.textColor,
                      fontSize: 16,
                      letterSpacing: 0.34,
                      fontWeight: FontWeight.normal)),
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  height: 50,
                  width: 150,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          canvasColor: model.bottomSheetBackgroundColor),
                      child: DropDown(
                          value: _selectedSplineType,
                          item: _splineList.map((String value) {
                            return DropdownMenuItem<String>(
                                value: (value != null) ? value : 'natural',
                                child: Text('$value',
                                    style: TextStyle(color: model.textColor)));
                          }).toList(),
                          valueChanged: (dynamic value) {
                            onPositionTypeChange(value.toString(), model);
                          }),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  /// Returns the spline types chart.
  SfCartesianChart getTypesSplineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: isCardView ? '' : 'Export growth of Brazil'),
      primaryXAxis: NumericAxis(
        majorGridLines: MajorGridLines(width: 0),
        interval: 1,
      ),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}%',
          minimum: -0.1,
          maximum: 0.2,
          interval: 0.1,
          majorTickLines: MajorTickLines(size: 0)),
      series: getSplineTypesSeries(),
      tooltipBehavior:
          TooltipBehavior(enable: true, header: '', canShowMarker: false),
    );
  }

  /// Returns the list of chart series which need to render on the spline chart.
  List<SplineSeries<_ChartData, num>> getSplineTypesSeries() {
    final List<_ChartData> chartData = <_ChartData>[
      _ChartData(2011, 0.05),
      _ChartData(2011.25, 0),
      _ChartData(2011.50, 0.03),
      _ChartData(2011.75, 0),
      _ChartData(2012, 0.04),
      _ChartData(2012.25, 0.02),
      _ChartData(2012.50, -0.01),
      _ChartData(2012.75, 0.01),
      _ChartData(2013, -0.08),
      _ChartData(2013.25, -0.02),
      _ChartData(2013.50, 0.03),
      _ChartData(2013.75, 0.05),
      _ChartData(2014, 0.04),
      _ChartData(2014.25, 0.02),
      _ChartData(2014.50, 0.04),
      _ChartData(2014.75, 0),
      _ChartData(2015, 0.02),
      _ChartData(2015.25, 0.10),
      _ChartData(2015.50, 0.09),
      _ChartData(2015.75, 0.11),
      _ChartData(2016, 0.12),
    ];
    return <SplineSeries<_ChartData, num>>[
      SplineSeries<_ChartData, num>(
          enableTooltip: true,
          /// To set the spline type here.
          splineType: _spline,
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          width: 2)
    ];
  }

  /// Method to change the spline type using dropdown menu.
  void onPositionTypeChange(String item, SampleModel model) {
    _selectedSplineType = item;
    if (_selectedSplineType == 'natural') {
      _spline = SplineType.natural;
    }
    if (_selectedSplineType == 'monotonic') {
      _spline = SplineType.monotonic;
    }
    if (_selectedSplineType == 'cardinal') {
      _spline = SplineType.cardinal;
    }
    if (_selectedSplineType == 'clamped') {
      _spline = SplineType.clamped;
    }
    setState(() {});
  }
}

/// Private class for storing the spline series data points.
class _ChartData {
  _ChartData(this.x, this.y);
  final double x;
  final double y;
}
