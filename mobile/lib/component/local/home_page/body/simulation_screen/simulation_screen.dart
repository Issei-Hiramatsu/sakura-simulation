import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'hooks/container_list.dart';
import 'hooks/use_change_animated_object.dart';
import 'hooks/use_fade_animation.dart';

class SimulationScreen extends ConsumerWidget {
  const SimulationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final beginIndex = ref.watch(beginIndexProvider);
    final endIndex = ref.watch(endIndexProvider);
    startFadeAnimation(ref);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 8.sp),
      child: Stack(
        children: [
          FadeTransition(
              opacity: fadeInAnimation,
              //TODO: 写真予定場所 下記の形式で行う。
              // Image.asset(
              //   'assets/images/sakura_road.jpg',
              //   fit: BoxFit.fill,
              //   height: double.infinity,
              // ),
              child: containerList[beginIndex]),
          FadeTransition(
              opacity: fadeOutAnimation,
              //TODO:  写真予定場所
              child: containerList[endIndex]),
        ],
      ),
    );
  }
}
