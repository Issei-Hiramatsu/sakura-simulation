import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sakura_simulation/component/shared/token/color/color.dart';

class WorkAndBreakPieChart extends StatelessWidget {
  const WorkAndBreakPieChart({
    super.key,
    required this.workMinutes,
    required this.breakMinutes,
    required this.chartWidth,
    required this.size,
  });

  final double size;
  final double workMinutes;
  final double breakMinutes;
  final double chartWidth;

  @override
  Widget build(BuildContext context) {
    //外側の円弧の部分が数えられていないためその部分を足す
    final circumference = (size - chartWidth) / 2;
    return SizedBox(
      width: size,
      height: size,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: circumference,
          startDegreeOffset: 270,
          sectionsSpace: 0,
          sections: [
            PieChartSectionData(
              color: secondary,
              value: workMinutes,
              title: '',
              radius: chartWidth,
            ),
            PieChartSectionData(
              color: primary10,
              value: breakMinutes,
              title: '',
              radius: chartWidth,
            ),
          ],
        ),
      ),
    );
  }
}
