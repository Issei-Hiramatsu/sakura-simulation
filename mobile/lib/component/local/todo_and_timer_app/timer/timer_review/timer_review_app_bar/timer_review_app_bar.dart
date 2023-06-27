import 'package:flutter/material.dart';

import '../../../../../../domain/user/user.dart';
import '../../../../../../importer.dart';
import '../../../../../../page/sakura_simulation_app.dart';
import '../../../../../shared/single/shared_app_bar/shared_app_bar.dart';
import '../../../../../shared/token/navigator/navigator.dart';

class TimerReviewAppBar extends StatelessWidget {
  const TimerReviewAppBar({
    super.key,
    required this.user,
  });

  final User user;
  @override
  Widget build(BuildContext context) {
    return SharedAppBar(
      leading: IconButton(
          onPressed: () {
            // tempTimerLog[DateTime(2023, 4, 1)]!
            //     .add(Duration(seconds: user.workSeconds));
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
