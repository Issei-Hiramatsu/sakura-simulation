import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'hooks/container_list.dart';

class SimulationScreen extends HookWidget {
  const SimulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        useAnimationController(duration: const Duration(seconds: 10));
    controller.repeat();
    return Stack(
      children: [
        FadeTransition(
            opacity: Tween(begin: 1.0, end: 0.0).animate(
              controller.drive(CurveTween(curve: Curves.linear)),
            ),
            //TODO: 写真予定場所
            child: containerList[0]),
        FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(
              controller.drive(CurveTween(curve: Curves.linear)),
            ),
            //TODO:  写真予定場所
            child: containerList[1]),
      ],
    );
  }
}
