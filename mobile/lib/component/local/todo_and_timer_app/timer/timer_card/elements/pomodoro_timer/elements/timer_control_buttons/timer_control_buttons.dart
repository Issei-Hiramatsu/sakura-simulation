import 'package:flutter/material.dart';
import 'package:sakura_simulation/importer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../../shared/single/button/circle_button/circle_button.dart';
import 'hook/use_timer_state.dart';

class TimerControlButtons extends ConsumerWidget {
  const TimerControlButtons({
    super.key,
    required this.startTimer,
    required this.stopTimer,
    required this.resumeTimer,
    required this.resetTimer,
  });
  final VoidCallback startTimer;
  final VoidCallback stopTimer;
  final VoidCallback resumeTimer;
  final VoidCallback resetTimer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerStateProvider);
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.sp),
        child: Row(
          children: [
            CircleElevatedButton(
              size: 70.sp,
              text: 'キャンセル',
              textStyle: labelLarge(white),
              backgroundColor: backgroundGray,
              onPressed: timerState == TimerState.notStarted
                  ? null
                  : () {
                      resetTimer();
                      ref.read(timerStateProvider.notifier).state =
                          TimerState.notStarted;
                    },
            ),
            const Spacer(),
            CircleElevatedButton(
                size: 70.sp,
                text: timerState.displayButtonText,
                textStyle: labelLarge(timerState.textColor),
                backgroundColor: timerState.backgroundColor,
                onPressed: () {
                  switch (timerState) {
                    case TimerState.notStarted:
                      return {
                        startTimer(),
                        ref.read(timerStateProvider.notifier).state =
                            TimerState.running
                      };
                    case TimerState.running:
                      return {
                        stopTimer(),
                        ref.read(timerStateProvider.notifier).state =
                            TimerState.paused
                      };
                    case TimerState.paused:
                      return {
                        resumeTimer(),
                        ref.read(timerStateProvider.notifier).state =
                            TimerState.running
                      };
                  }
                })
          ],
        ));
  }
}
