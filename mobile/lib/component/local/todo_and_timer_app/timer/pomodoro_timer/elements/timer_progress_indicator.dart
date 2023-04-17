import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../shared/token/color/color.dart';

class TimerProgressIndicator extends HookWidget {
  const TimerProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 350.sp,
          height: 350.sp,
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 10000),
            builder: (context, value, _) => CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(gray),
              backgroundColor: secondary,
              value: value,
              strokeWidth: 12.sp,
            ),
          ),
        ),
      ],
    );
  }
}
