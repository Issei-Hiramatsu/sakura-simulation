import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final controller = useAnimationController(
  duration: const Duration(seconds: 4),
);

Animation<double> animation = Tween(begin: 1.0, end: 0.0).animate(
  controller.drive(CurveTween(curve: Curves.linear)),
);

void startFadeAnimation() {
  controller.forward();
  animation.addListener(() {
    if (controller.status == AnimationStatus.completed) {
      // アニメーションが終了したときに実行したい関数を設定する
      controller.reset();
      controller.forward();
    }
  });
}
