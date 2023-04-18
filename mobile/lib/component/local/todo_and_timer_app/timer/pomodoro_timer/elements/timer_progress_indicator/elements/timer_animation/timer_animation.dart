import 'package:flutter/material.dart';

import '../../../../../../../../shared/token/color/color.dart';

class TimerAnimation extends StatelessWidget {
  const TimerAnimation({
    super.key,
    required this.strokeWidth,
    required this.size,
  });
  final double size;
  final double strokeWidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 100000),
        builder: (context, value, _) => CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(gray),
          value: value,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}
