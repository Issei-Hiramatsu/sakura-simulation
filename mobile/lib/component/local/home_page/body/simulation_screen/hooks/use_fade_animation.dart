import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'use_change_animated_object.dart';

//アニメーションを定義する
final fadeInController =
    useAnimationController(duration: const Duration(seconds: 4));
final fadeOutController =
    useAnimationController(duration: const Duration(seconds: 4));

Animation<double> fadeInAnimation = Tween(begin: 1.0, end: 0.0).animate(
  fadeInController.drive(CurveTween(curve: Curves.linear)),
);
Animation<double> fadeOutAnimation = Tween(begin: 0.0, end: 1.0).animate(
  fadeOutController.drive(CurveTween(curve: Curves.linear)),
);

void startFadeAnimation() {
  fadeInController.forward();
  fadeOutController.forward();
  fadeInAnimation.addListener(() {
    if (fadeInController.status == AnimationStatus.completed) {
      changeFadeInAnimatedObject();
      fadeInController.reset();
      fadeInController.forward();
    }
  });

  fadeOutAnimation.addListener(() {
    if (fadeOutController.status == AnimationStatus.completed) {
      changeFadeOutAnimatedObject();
      fadeOutController.reset();
      fadeOutController.forward();
    }
  });
}
