import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../component/shared/single/shared_app_bar/shared_app_bar.dart';
import '../../../../../../importer.dart';
import 'hooks/fetch_timer_worked_type.dart';
import '/component/local/todo_and_timer_app/timer/timer_setting_card/timer_setting_card.dart';

class TimerSettingPage extends ConsumerWidget {
  const TimerSettingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46.sp),
        child: SharedAppBar(
          automaticallyImplyLeading: true,
          titleText: '選択',
          textStyle: titleMedium(white),
        ),
      ),
      body: Column(
        children: [
          ref.watch(fetchAllTimerWorkedType(context)).when(
                data: (dataList) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: dataList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TimerSettingCard(
                          text: dataList[index],
                          onTap: () {},
                        );
                      },
                    ),
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
              ),
        ],
      ),
    );
  }
}
