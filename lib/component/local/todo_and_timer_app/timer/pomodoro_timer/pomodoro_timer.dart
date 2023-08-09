import 'package:flutter/material.dart';
import 'package:sakura_simulation/importer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../domain/timer_log/timer_log.dart';
import 'elements/timer_control_buttons/timer_control_buttons.dart';
import 'elements/timer_progress_indicator/timer_progress_indicator.dart';
import '/page/todo_and_timer_page/elements/timer_app/elements/timer_review_page/timer_review_page.dart';
import '../../../../shared/token/navigator/navigator.dart';
import '../timer_review/hooks/use_stop_watch.dart';
import 'hooks/use_pomodoro_timer.dart';

class PomodoroTimer extends ConsumerWidget {
  const PomodoroTimer({
    super.key,
    required this.workedSeconds,
    required this.workedType,
  });

  final int workedSeconds;
  final String workedType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TimerLog timerLog = TimerLog(
      statedAt: DateTime.now(),
    );
    final remainSeconds = ref.watch(usePomodoroTimerProvider);
    final workSeconds = workedSeconds * 60 - remainSeconds;

    void initiateReviewStopWatchWorkflow() {
      ref.read(useStopUseStopWatchProvider.notifier).startTimer();
      NavigatorPush(
        context,
        page: TimerReviewPage(
          timerLog: TimerLog(
            statedAt: timerLog.statedAt,
            workedTime: Duration(seconds: workSeconds),
            workedType: workedType,
          ),
        ),
      );
    }

    if (remainSeconds == 0) {
      Future(() {
        ref
            .read(usePomodoroTimerProvider.notifier)
            .resetTimer(workedSeconds * 60);
        initiateReviewStopWatchWorkflow();
      });
    }
    String displayTime;
    if (workedSeconds >= 60) {
      displayTime = Duration(seconds: remainSeconds).toString().substring(0, 7);
    } else {
      displayTime = Duration(seconds: remainSeconds).toString().substring(2, 7);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SpaceBox(height: 12.sp),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            const TimerProgressIndicator(),
            Text(displayTime, style: displayLarge(black)),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.sp),
          child: TimerControlButtons(
              startTimer: () {
                ref
                    .read(usePomodoroTimerProvider.notifier)
                    .startTimer(workedSeconds * 60);
              },
              stopTimer: () =>
                  ref.read(usePomodoroTimerProvider.notifier).stopTimer(),
              resumeTimer: () => ref
                  .read(usePomodoroTimerProvider.notifier)
                  .resumeTimer(remainSeconds),
              resetTimer: () {
                ref
                    .read(usePomodoroTimerProvider.notifier)
                    .resetTimer(workedSeconds * 60);
                initiateReviewStopWatchWorkflow();
              }),
        ),
      ],
    );
  }
}
