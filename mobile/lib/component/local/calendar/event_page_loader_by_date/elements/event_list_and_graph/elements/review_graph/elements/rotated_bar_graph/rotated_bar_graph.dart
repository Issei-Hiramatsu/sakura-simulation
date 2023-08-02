import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '/domain/user/elements/timer_log/timer_log.dart';
import '../../../../../../../../../shared/token/color/color.dart';

class RotatedBarGraph extends StatelessWidget {
  const RotatedBarGraph({
    super.key,
    required this.timerLog,
  });

  final Map<String, List<TimerLog>> timerLog;

  @override
  Widget build(BuildContext context) {
    //棒グラフのアイテムを作成する
    //TODO: 色を変更する
    List<BarChartRodStackItem> rodStackItems = [];
    double previousTotalValue = 0.0;
    for (var timerLogList in timerLog.values) {
      final workedMinutes = timerLogList
          .fold(
              0,
              (int previousValue, TimerLog timerLog) =>
                  previousValue + timerLog.workedTime.inMinutes)
          .toDouble();

      rodStackItems.add(
        BarChartRodStackItem(previousTotalValue, workedMinutes, primary),
      );
      previousTotalValue = workedMinutes;
    }

    return RotatedBox(
      quarterTurns: 1,
      child: BarChart(
        BarChartData(
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show: false),
          barGroups: [
            BarChartGroupData(groupVertically: true, x: 0, barRods: [
              BarChartRodData(
                borderRadius: BorderRadius.circular(8),
                color: gray,
                toY: previousTotalValue,
                width: 40,
                rodStackItems: rodStackItems,
              )
            ]),
          ],
        ),
      ),
    );
  }
}
