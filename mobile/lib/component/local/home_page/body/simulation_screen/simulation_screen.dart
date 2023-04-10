import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SimulationScreen extends HookWidget {
  const SimulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        useAnimationController(duration: const Duration(seconds: 10));
    controller.repeat();
    return Column(
      children: [
        FadeTransition(
          opacity: Tween(begin: 1.0, end: 0.0).animate(
            controller.drive(CurveTween(curve: Curves.linear)),
          ),
          //TODO: 写真予定場所
          child: const Placeholder(
              fallbackHeight: 300, fallbackWidth: double.infinity),
        ),
        FadeTransition(
          opacity: controller.drive(CurveTween(curve: Curves.linear)),
          //TODO:  写真予定場所
          child: const Placeholder(
              fallbackHeight: 300, fallbackWidth: double.infinity),
        ),
      ],
    );
  }
}
