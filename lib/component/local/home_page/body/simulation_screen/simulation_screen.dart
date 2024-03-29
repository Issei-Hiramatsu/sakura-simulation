import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'hooks/full_bloom_sakura_lis.dart';

class SimulationScreen extends HookConsumerWidget {
  const SimulationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TODO: 複数の役割が持つように分離させたかったがhooksをうまく分離させることができなかった。
    // アニメーションは動くが　数字を変えるとアニメーションが停止する
    final beginIndex = useState(0);
    final endIndex = useState(1);
    void changeFadeInAnimatedObject() {
      beginIndex.value = 1;
      if (beginIndex.value == fullBloomSakuraList.length) {
        beginIndex.value = 0;
      }
    }

    void changeFadeOutAnimatedObject() {
      endIndex.value++;
      if (endIndex.value == fullBloomSakuraList.length) {
        endIndex.value = 0;
      }
    }

    final fadeInController =
        useAnimationController(duration: const Duration(seconds: 20));
    final fadeOutController =
        useAnimationController(duration: const Duration(seconds: 20));

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

    startFadeAnimation();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 8.sp),
      child: Stack(
        children: [
          FadeTransition(
            opacity: fadeInAnimation,
            child: Image.asset(
              fullBloomSakuraList[beginIndex.value],
              fit: BoxFit.fill,
              height: double.infinity,
            ),
          ),
          FadeTransition(
            opacity: fadeOutAnimation,
            child: Image.asset(
              fullBloomSakuraList[endIndex.value],
              fit: BoxFit.fill,
              height: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
