import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakura_simulation/component/shared/token/color/color.dart';
import 'package:sakura_simulation/component/shared/token/text_style/text_style.dart';

import '../../../../shared/single/button/circle_button/circle_button.dart';
import 'elements/timer_progress_indicator/timer_progress_indicator.dart';

class PomodoroTimerWithTodo extends StatelessWidget {
  const PomodoroTimerWithTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const TimerProgressIndicator(),
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
