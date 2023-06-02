import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sakura_simulation/importer.dart';

class GraphDetailCard extends StatelessWidget {
  const GraphDetailCard({
    super.key,
    required this.title,
    required this.timeText,
    required this.barColor,
  });

  final String title;
  final String timeText;
  final Color barColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 12,
          height: 40,
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
                      toY: 1,
                      color: barColor,
                      width: 8,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SpaceBox(width: 12),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: caption1Regular(gray)),
            Text(timeText, style: title3Bold(black)),
          ],
        )
      ],
    );
  }
}
