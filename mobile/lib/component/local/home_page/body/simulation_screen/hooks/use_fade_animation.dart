import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

//アニメーションを定義する
final controller = useAnimationController(
  duration: const Duration(seconds: 4),
);

Animation<double> fadeInAnimation = Tween(begin: 0.0, end: 1.0).animate(
  controller.drive(CurveTween(curve: Curves.linear)),
);
Animation<double> fadeOutAnimation = Tween(begin: 1.0, end: 0.0).animate(
  controller.drive(CurveTween(curve: Curves.linear)),
);

void startFadeAnimation() {
  controller.forward();
  fadeInAnimation.addListener(() {
    if (controller.status == AnimationStatus.completed) {
      controller.reset();
      controller.forward();
    }
  });
  //FIXME: fadeoutアニメーションが反応していないことを確認。
  fadeOutAnimation.addListener(() {
    if (controller.status == AnimationStatus.completed) {
      controller.reset();
      controller.forward();
    }
  });
}
