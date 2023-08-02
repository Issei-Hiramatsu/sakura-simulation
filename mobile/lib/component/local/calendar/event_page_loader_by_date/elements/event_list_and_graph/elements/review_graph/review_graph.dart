import 'package:flutter/material.dart';
import 'package:sakura_simulation/importer.dart';

import '/domain/user/elements/timer_log/timer_log.dart';
import 'elements/graph_detail_card/graph_detail_card.dart';
import 'elements/rotated_bar_graph/rotated_bar_graph.dart';

class ReviewGraph extends StatelessWidget {
  const ReviewGraph({
    super.key,
    required this.timerLog,
  });

  final Map<String, List<TimerLog>> timerLog;
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
            Expanded(child: RotatedBarGraph(timerLog: timerLog)), //TODO: 色をかえる。
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: timerLog.length,
                      itemBuilder: (context, index) {
                        String key = timerLog.keys.elementAt(index);
                        final focusedMinutes = timerLog[key]!.fold(
                            0,
                            (int previousValue, TimerLog timerLog) =>
                                previousValue + timerLog.workedTime.inMinutes);
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GraphDetailCard(
                            title: key,
                            timeText: '$focusedMinutes分',
                            barColor: primary, //TODO: 色をかえる。
                          ),
                        );
                      },
                    ),
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
