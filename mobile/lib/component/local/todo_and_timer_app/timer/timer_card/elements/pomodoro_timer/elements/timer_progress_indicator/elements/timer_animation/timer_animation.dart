import 'package:flutter/material.dart';
import 'package:sakura_simulation/component/local/todo_and_timer_app/timer/timer_card/elements/pomodoro_timer/hooks/temp_user_settings.dart';

import '../../../../../../../../../../shared/token/color/color.dart';

class TimerAnimation extends StatelessWidget {
  const TimerAnimation({
    super.key,
    required this.strokeWidth,
    required this.size,
    required this.animationStatusEnd,
  });
  final double size;
  final double strokeWidth;
  final double animationStatusEnd;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: animationStatusEnd),
        duration: const Duration(minutes: workTime),
        builder: (context, value, _) => CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(gray),
          value: value,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}
