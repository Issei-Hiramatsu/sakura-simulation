import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../shared/token/color/color.dart';

class RotatedBarGraph extends StatelessWidget {
  const RotatedBarGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: BarChart(
        BarChartData(
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show: false),
          barGroups: [
            BarChartGroupData(
              groupVertically: true,
              x: 0,
              barRods: [
                BarChartRodData(
                  borderRadius: BorderRadius.circular(8),
                  color: gray,
                  toY: 100, //ここにトータルの分数
                  width: 40,
                  rodStackItems: [
                    BarChartRodStackItem(0, 80, primary),
                    BarChartRodStackItem(80, 90, secondary),
                    BarChartRodStackItem(90, 95, black),
                    BarChartRodStackItem(0, 0, secondary),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
