import 'package:flutter/material.dart';

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
        duration: const Duration(minutes: 1), //ここを0にすればアニメーションがリセットされる
        builder: (context, value, _) => CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(gray),
          value: value,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}
