import 'package:flutter/material.dart';
import 'package:sakura_simulation/importer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/domain/user/elements/timer_log/timer_log.dart';
import '../timer_review/hooks/use_stop_watch.dart';
import 'elements/timer_control_buttons/timer_control_buttons.dart';
import 'elements/timer_progress_indicator/timer_progress_indicator.dart';
import '/domain/user/user.dart';
import '/page/todo_and_timer_page/elements/timer_app/elements/timer_review_page/timer_review_page.dart';
import 'hooks/use_pomodoro_timer.dart';
import '../../../../shared/token/navigator/navigator.dart';

class PomodoroTimer extends ConsumerWidget {
  const PomodoroTimer({
    super.key,
    required this.user,
    required this.workedType,
  });

  final User user;
  final String workedType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TimerLog timerLog = TimerLog(
      statedAt: DateTime.now(),
    );
    final remainSeconds = ref.watch(usePomodoroTimerProvider);
    final workSeconds = user.workTime * 60 - remainSeconds;

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
            .resetTimer(user.workTime * 60);
        initiateReviewStopWatchWorkflow();
      });
    }

    final displayTime =
        Duration(seconds: remainSeconds).toString().substring(2, 7);

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
                    .startTimer(user.workTime * 60);
              },
              stopTimer: () =>
                  ref.read(usePomodoroTimerProvider.notifier).stopTimer(),
              resumeTimer: () => ref
                  .read(usePomodoroTimerProvider.notifier)
                  .resumeTimer(remainSeconds),
              resetTimer: () {
                ref
                    .read(usePomodoroTimerProvider.notifier)
                    .resetTimer(user.workTime * 60);
                initiateReviewStopWatchWorkflow();
              }),
        ),
      ],
    );
  }
}
