import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../domain/user/user.dart';
import '../../../../../../importer.dart';
import '../../../../../../page/sakura_simulation_app.dart';
import '../../../../../shared/single/shared_app_bar/shared_app_bar.dart';
import '../../../../../shared/token/navigator/navigator.dart';
import '../hooks/use_stop_watch.dart';

class TimerReviewAppBar extends ConsumerWidget {
  const TimerReviewAppBar({
    super.key,
    required this.user,
  });

  final User user;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SharedAppBar(
      leading: IconButton(
          onPressed: () {
            // tempTimerLog[DateTime(2023, 4, 1)]!
            //     .add(Duration(seconds: user.workSeconds));
            ref.read(useStopUseStopWatchProvider.notifier).resetTimer();
            NavigatorPushReplacement(context,
                page: const SakuraSimulationApp(pageIndex: 2));
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: white,
          )),
      titleText: 'タイマー終了',
      textStyle: titleMedium(white),
    );
  }
}
