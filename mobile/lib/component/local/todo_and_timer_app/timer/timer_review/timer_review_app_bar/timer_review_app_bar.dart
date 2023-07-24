import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/component/local/todo_and_timer_app/timer/timer_review/timer_review_app_bar/hooks/use_timer_review.dart';

import '/importer.dart';
import '/page/sakura_simulation_app.dart';
import '../../../../../shared/single/shared_app_bar/shared_app_bar.dart';
import '../../../../../shared/token/navigator/navigator.dart';
import '../hooks/use_stop_watch.dart';

class TimerReviewAppBar extends ConsumerWidget {
  const TimerReviewAppBar({
    super.key,
    required this.workSeconds,
  });

  final int workSeconds;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final elapsedTime = ref.watch(useStopUseStopWatchProvider);
    return SharedAppBar(
      leading: IconButton(
          onPressed: () {
            ref.read(updateTimerLogProvider).updateTimerLog(
                  date: DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                  ),
                  workedType: '集中時間',
                  workedTime: Duration(
                    seconds: workSeconds + elapsedTime.inSeconds,
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
