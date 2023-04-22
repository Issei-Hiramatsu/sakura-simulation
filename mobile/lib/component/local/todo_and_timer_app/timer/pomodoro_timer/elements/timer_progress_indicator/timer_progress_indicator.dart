import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../hooks/temp_user_settings.dart';
import '../../pomodoro_timer.dart';
import 'elements/timer_animation/timer_animation.dart';
import 'elements/work_and_break_pie_chart/work_and_break_pie_chart.dart';

class TimerProgressIndicator extends HookConsumerWidget {
  const TimerProgressIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer =
        ref.watch(cooperationTimerProvider) / 60; //ミリ秒まで取得してしまうので分の単位に直す
    final end = 1 - timer / workTime; //1分に対しての比率を求められる //1は最大値を表す。
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
          animationStatusEnd: end,
        ),
      ],
    );
  }
}
