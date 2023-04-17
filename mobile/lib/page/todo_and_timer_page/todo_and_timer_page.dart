import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../component/local/todo_and_timer_app/custom_tab_bar/custom_tab_bar.dart';
import 'elements/timer_app/timer_app_page.dart';
import 'elements/todo_app/todo_app_page.dart';

class TodoAndTimerPage extends StatelessWidget {
  const TodoAndTimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(42.sp), child: AppBar()),
        body: Column(
          children: [
            CustomTabBar(
              tab: [
                Tab(text: 'タスク', height: 26.sp),
                Tab(text: 'タイマー', height: 26.sp),
              ],
            ),
            const Expanded(
              child: TabBarView(children: [
                TodoAppPage(),
                TimerAppPage(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
