import 'package:flutter_examples/model/sample_view.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';


class RadialLabelCustomization extends SampleView {
  const RadialLabelCustomization(Key key) : super(key: key);
  
  @override
  _RadialLabelCustomizationState createState() =>
      _RadialLabelCustomizationState();
}

class _RadialLabelCustomizationState extends SampleViewState {
  _RadialLabelCustomizationState();
  
  @override
  Widget build(BuildContext context) {
    return getRadialLabelCustomization();
  }

SfRadialGauge getRadialLabelCustomization() {
  return SfRadialGauge(
    axes: <RadialAxis>[
      RadialAxis(
          startAngle: 180,
          endAngle: 360,
          canScaleToFit: true,
          interval: 10,
          radiusFactor: 0.95,
          labelFormat: '{value}%',
          labelsPosition: ElementsPosition.outside,
          ticksPosition: ElementsPosition.inside,
          labelOffset: 15,
          minorTickStyle: MinorTickStyle(
              length: 0.05, lengthUnit: GaugeSizeUnit.factor, thickness: 1.5),
          majorTickStyle: MajorTickStyle(
              length: 0.1, lengthUnit: GaugeSizeUnit.factor, thickness: 1.5),
          minorTicksPerInterval: 5,
          pointers: <GaugePointer>[
            NeedlePointer(
                value: 70,
                needleStartWidth: 1,
                needleEndWidth: 3,
                needleLength: 0.8,
                lengthUnit: GaugeSizeUnit.factor,
                knobStyle: KnobStyle(
                  knobRadius: 8,
                  sizeUnit: GaugeSizeUnit.logicalPixel,
                ),
                tailStyle: TailStyle(
                    width: 3,
                    lengthUnit: GaugeSizeUnit.logicalPixel,
                    length: 20))
          ],
          axisLabelStyle:
              GaugeTextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          axisLineStyle:
              AxisLineStyle(thickness: 3, color: const Color(0xFF00A8B5))),
    ],
  );
}
}