import 'package:flutter/material.dart';
import 'package:sakura_simulation/importer.dart';

import 'elements/graph_detail_card/graph_detail_card.dart';
import 'elements/rotated_bar_graph/rotated_bar_graph.dart';

class ReviewGraph extends StatelessWidget {
  const ReviewGraph({
    super.key,
    required this.timerLog,
  });

  final Map<String, List<Duration>> timerLog;
  @override
  Widget build(BuildContext context) {
    //それぞれのkeyごとに追加する
    final focusedMinutes = timerLog['集中']!.fold(
        0,
        (int previousValue, Duration duration) =>
            previousValue + duration.inMinutes);
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
            Expanded(
                child: RotatedBarGraph(
              focusedMinutes: focusedMinutes,
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  GraphDetailCard(
                    title: '集中時間',
                    timeText: '$focusedMinutes分',
                    barColor: primary,
                  ),
                  const SpaceBox(width: 8),
                  const GraphDetailCard(
                    title: '休憩時間',
                    timeText: '0分',
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
