import 'package:flutter/material.dart';
import 'package:sakura_simulation/component/local/todo_and_timer_app/custom_tab_bar/custom_tab_bar.dart';
import 'package:sakura_simulation/component/shared/single/bottom_navigation/bottom_navigation.dart';

import 'elements/todo_app_page.dart';

class TodoAndTimerPage extends StatelessWidget {
  const TodoAndTimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const CustomTabBar(
              tab: [
                Tab(text: 'すべて', height: 32),
                Tab(text: 'その他', height: 32),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                const TodoPage(),
                Container(),
              ]),
            ),
            const BottomNavigation()
          ],
        ),
      ),
    );
  }
}
