import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sakura_simulation/domain/default_data.dart';
import 'package:sakura_simulation/importer.dart';
import 'package:sakura_simulation/page/todo_and_timer_page/elements/timer_app/elements/timer_review_page/hooks/temp_timer_log.dart';

import 'elements/graph_detail_card/graph_detail_card.dart';
import 'elements/rotated_bar_graph/rotated_bar_graph.dart';

class EventGraph extends StatelessWidget {
  const EventGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.sp,
      decoration: BoxDecoration(
        border: Border.all(
          color: gray,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(8),
        color: backgroundWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('振り返り', style: caption1Bold(black)),
            const Expanded(child: RotatedBarGraph()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  GraphDetailCard(
                    title: '集中時間',
                    timeText:
                        '${tempTimerLog[DateTime(2023, 4, 1)]![0].inMinutes}分',
                    barColor: primary,
                  ),
                  const SpaceBox(width: 8),
                  const GraphDetailCard(
                    title: '休憩時間',
                    timeText: '5分',
                    barColor: secondary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
