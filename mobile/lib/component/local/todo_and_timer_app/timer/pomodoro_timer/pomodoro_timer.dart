import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:sakura_simulation/component/shared/token/color/color.dart';
import 'package:sakura_simulation/component/shared/token/space_box/space_box.dart';
import 'package:sakura_simulation/component/shared/token/text_style/text_style.dart';

import '../../../../shared/single/button/circle_button/circle_button.dart';
import 'elements/timer_progress_indicator/timer_progress_indicator.dart';
import 'hooks/temp_user_settings.dart';

final cooperationTimerProvider = StateProvider<int>((ref) => 0);

//知りたいこと　initStateを使う意味
//DateTime.now()とは何者なのか

class PomodoroTimer extends ConsumerStatefulWidget {
  const PomodoroTimer({Key? key}) : super(key: key);

  @override
  PomodoroTimerState createState() => PomodoroTimerState();
}

class PomodoroTimerState extends ConsumerState {
  DateTime? _createTime;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _createTime = DateTime.now();
  }

  void startTimer(int minutes) {
    final createTime = _createTime!.add(Duration(minutes: minutes));
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final remain = createTime.difference(DateTime.now());
      if (remain > Duration.zero) {
        ref.read(cooperationTimerProvider.notifier).state =
            remain.inMilliseconds;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final timer = ref.watch(cooperationTimerProvider);
    final displayTime =
        Duration(milliseconds: timer).toString().substring(2, 7); //タイマーの領域を指定する
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SpaceBox(height: 12.sp),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            const TimerProgressIndicator(),
            Text(displayTime, style: displayLarge(black)),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.sp),
          child: Row(
            children: [
              CircleElevatedButton(
                size: 70.sp,
                text: 'キャンセル',
                textStyle: labelLarge(primary),
                onPressed: () {
                  startTimer(workTime);
                },
              ),
              const Spacer(),
              CircleElevatedButton(
                size: 70.sp,
                text: '一時停止',
                textStyle: labelLarge(primary),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
