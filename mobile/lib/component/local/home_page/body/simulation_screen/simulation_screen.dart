import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'hooks/container_list.dart';

class SimulationScreen extends HookWidget {
  const SimulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // AnimationControllerを作成
    final controller =
        useAnimationController(duration: const Duration(seconds: 4));

// Animation<double>オブジェクトを作成
    Animation<double> animation = Tween(begin: 1.0, end: 0.0).animate(
      controller.drive(CurveTween(curve: Curves.linear)),
    );

// onEndプロパティに関数を設定
    animation.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        // アニメーションが終了したときに実行したい関数
        controller.reset();
        controller.forward();
      }
    });
    controller.forward();

    return Stack(
      children: [
        FadeTransition(
            opacity: animation,
            //TODO: 写真予定場所
            child: containerList[0]),
        FadeTransition(
            opacity: animation,
            //TODO:  写真予定場所
            child: containerList[1]),
      ],
    );
  }
}
