import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../../domain/user_info/elements/timer_log/timer_log.dart';
import '/importer.dart';

import '/page/sakura_simulation_app.dart';
import '../hooks/use_stop_watch.dart';
import 'hooks/use_timer_review.dart';
import '../../../../../shared/single/shared_app_bar/shared_app_bar.dart';
import '../../../../../shared/token/navigator/navigator.dart';

class TimerReviewAppBar extends ConsumerWidget {
  const TimerReviewAppBar({
    super.key,
    required this.timerLog,
  });

  final TimerLog timerLog;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final elapsedTime = ref.watch(useStopUseStopWatchProvider);
    return SharedAppBar(
      leading: IconButton(
          onPressed: () {
            ref.read(addTimerLogProvider).addTimerLog(
                  timerLog: TimerLog(
                    statedAt: timerLog.statedAt,
                    endAt: DateTime.now(),
                    workedType: timerLog.workedType,
                    workedTime: Duration(
                      seconds:
                          timerLog.workedTime.inSeconds + elapsedTime.inSeconds,
                    ),
                  ),
                );
            ref.read(useStopUseStopWatchProvider.notifier).resetTimer();

            NavigatorPushReplacement(context,
                page: const SakuraSimulationApp(pageIndex: 2));
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: white,
          )),
      titleText: 'タイマー終了',
      textStyle: titleMedium(white),
    );
  }
}
