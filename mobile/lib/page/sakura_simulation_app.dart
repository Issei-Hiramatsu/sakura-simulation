import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../component/shared/single/bottom_navigation/bottom_navigation.dart';
import '/domain/default_data.dart';
import '/page/home/home_page.dart';
import '/page/todo_and_timer_page/todo_and_timer_page.dart';
import '/page/calendar/calendar_page.dart';
import '/page/profile/profile_page.dart';

class SakuraSimulationApp extends HookWidget {
  const SakuraSimulationApp({
    this.pageIndex = 0,
    Key? key,
  }) : super(key: key);

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(pageIndex);
    final defaultUser = defaultData[0];
    List pageList = [
      const HomePage(),
      TodoAndTimerPage(user: defaultUser),
      CalendarPage(user: defaultUser),
      const SlackProfilePage(
        name: 'Issei',
        photoUrl: '0',
      ),
    ];
    return SafeArea(
      child: Scaffold(
        body: pageList[selectedIndex.value],
        bottomNavigationBar: BottomNavigation(
          currentIndex: selectedIndex.value,
          onTap: (index) => selectedIndex.value = index,
        ),
      ),
    );
  }
}
