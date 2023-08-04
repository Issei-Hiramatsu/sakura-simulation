import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'elements/timer_animation/timer_animation.dart';
import 'elements/work_and_break_pie_chart/work_and_break_pie_chart.dart';
import 'hooks/use_pomodoro_timer.dart';

class TimerProgressIndicator extends HookConsumerWidget {
  const TimerProgressIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerRatio = ref.watch(timerAnimationParameterProvider);

    return Stack(
      children: [
        WorkAndBreakPieChart(
          size: 350.sp,
          breakMinutes: 5,
          workMinutes: 25,
          chartWidth: 12.sp,
        ),
        TimerAnimation(
          size: 350.sp,
          strokeWidth: 12.sp,
          animationStatusEnd: timerRatio,
        ),
      ],
    );
  }
}
