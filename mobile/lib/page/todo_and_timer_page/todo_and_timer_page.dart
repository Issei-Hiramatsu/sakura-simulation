import 'package:flutter/material.dart';
import 'package:sakura_simulation/component/local/todo_and_timer_app/custom_tab_bar/custom_tab_bar.dart';
import 'package:sakura_simulation/component/shared/single/bottom_navigation/bottom_navigation.dart';
import 'package:sakura_simulation/page/todo_and_timer_page/elements/timer_app/timer_app_page.dart';

import 'elements/todo_app/todo_app_page.dart';

class TodoAndTimerPage extends StatelessWidget {
  const TodoAndTimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: const [
            CustomTabBar(
              tab: [
                Tab(text: 'タスク', height: 32),
                Tab(text: 'タイマー', height: 32),
              ],
            ),
            Expanded(
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
