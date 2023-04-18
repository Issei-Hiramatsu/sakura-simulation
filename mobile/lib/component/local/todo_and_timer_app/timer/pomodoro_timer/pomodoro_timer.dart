import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sakura_simulation/component/local/todo_and_timer_app/timer/pomodoro_timer/hooks/use_pomodoro_timer.dart';
import 'package:sakura_simulation/component/shared/token/color/color.dart';
import 'package:sakura_simulation/component/shared/token/text_style/text_style.dart';

import '../../../../shared/single/button/circle_button/circle_button.dart';
import 'elements/timer_progress_indicator/timer_progress_indicator.dart';

class PomodoroTimer extends ConsumerWidget {
  const PomodoroTimer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(timerProvider.notifier).state;
    final timerFormat = DateFormat.ms('ja').format(timer);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            const TimerProgressIndicator(),
            Text(timerFormat, style: displayLarge(black)),
          ],
        ),
        Row(
          children: [
            CircleElevatedButton(
              size: 70.sp,
              text: 'キャンセル',
              textStyle: labelLarge(primary),
            ),
            const Spacer(),
            CircleElevatedButton(
              size: 70.sp,
              text: '一時停止',
              textStyle: labelLarge(primary),
            ),
          ],
        ),
      ],
    );
  }
}
