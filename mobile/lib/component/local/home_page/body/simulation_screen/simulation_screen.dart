import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'hooks/container_list.dart';
import 'hooks/use_fade_animation.dart';

class SimulationScreen extends HookWidget {
  const SimulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    startFadeAnimation();
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
