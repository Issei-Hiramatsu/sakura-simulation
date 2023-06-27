import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/component/local/todo_and_timer_app/timer/timer_review/hooks/use_stop_watch.dart';
import '../../../../../../importer.dart';
import '../../../../../shared/single/icon_image/icon_image.dart';

class SakuraReviewScreen extends ConsumerWidget {
  const SakuraReviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stopwatch = ref.watch(useStopUseStopWatchProvider);
    final displayTime =
        '${(stopwatch.inHours).toString().padLeft(2, '0')}:${(stopwatch.inMinutes % 60).toString().padLeft(2, '0')}:${(stopwatch.inSeconds % 60).toString().padLeft(2, '0')}';

    return Column(
      children: [
        Text('お疲れ様です！', style: title2Regular(black)),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 8.sp),
          child: Text(
            'タスクを精算し次のタスクを準備してから\n休憩に行くとスムーズに始められますよ',
            style: caption1Regular(black),
            textAlign: TextAlign.center,
          ),
        ),
        Text('経過時間: $displayTime'),
        SpaceBox(height: 8.sp),
        const IconImage(assets: 'assets/images/sakura_icon.jpg'),
      ],
    );
  }
}
