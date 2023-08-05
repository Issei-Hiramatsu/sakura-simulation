import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '/importer.dart';

import '/domain/user_info/user_info.dart';
import '/component/local/todo_and_timer_app/timer/timer_setting/add_worked_type_modal/add_worked_type_modal.dart';
import '/component/local/todo_and_timer_app/timer/timer_setting/worked_type_list_view/worked_type_list_view.dart';
import '/component/shared/single/button/floating_circle_button/floating_circle_button.dart';
import '/component/shared/single/shared_app_bar/shared_app_bar.dart';

class TimerSettingPage extends ConsumerWidget {
  const TimerSettingPage({
    super.key,
    required this.user,
  });

  final UserInfo user;

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
      body: TimerSettingListView(user: user),
      floatingActionButton: FloatingCircleButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          addWorkedTypeModal(context, ref);
        },
      ),
    );
  }
}
