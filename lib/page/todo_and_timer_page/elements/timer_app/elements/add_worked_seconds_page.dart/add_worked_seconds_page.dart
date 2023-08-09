import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/component/shared/token/navigator/navigator.dart';
import 'package:sakura_simulation/importer.dart';
import 'package:sakura_simulation/page/todo_and_timer_page/elements/timer_app/elements/timer_setting_page/timer_setting_page.dart';

import '../../../../../../component/local/todo_and_timer_app/timer/worked_seconds_list_view/elements/hooks/use_worked_seconds_list.dart';
import '../../../../../../component/shared/single/shared_app_bar/shared_app_bar.dart';

class AddWorkedSecondsPage extends HookConsumerWidget {
  const AddWorkedSecondsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seconds = useState<double>(3);
    final displayTime = seconds.value.toInt();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46.sp),
        child: SharedAppBar(
          automaticallyImplyLeading: true,
          titleText: '選択',
          textStyle: titleMedium(white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$displayTime分', style: title1Regular(black)),
            Slider(
              activeColor: primary,
              thumbColor: primary,
              inactiveColor: primary10,
              min: 3,
              max: 120,
              value: seconds.value,
              onChanged: (value) {
                seconds.value = value;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: primary),
              onPressed: () {
                ref
                    .read(workedSecondsProvider)
                    .addWorkedSeconds(workedSeconds: seconds.value.toInt());
                NavigatorPush(
                  context,
                  page: TimerSettingPage(workedSeconds: seconds.value.toInt()),
                );
              },
              child: const Text('集中を開始する'),
            ),
          ],
        ),
      ),
    );
  }
}
