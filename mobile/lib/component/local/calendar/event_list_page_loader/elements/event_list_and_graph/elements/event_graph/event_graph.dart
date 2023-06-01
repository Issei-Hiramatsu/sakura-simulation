import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sakura_simulation/importer.dart';

class EventGraph extends StatelessWidget {
  const EventGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: gray,
          width: 0.5,
        ),
        color: backgroundWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: RotatedBox(
          quarterTurns: 1,
          child: BarChart(
            BarChartData(
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(show: false),
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(
                      borderRadius: BorderRadius.circular(8),
                      toY: 8,
                      color: Colors.blue,
                      width: 40,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
