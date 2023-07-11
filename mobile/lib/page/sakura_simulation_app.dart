import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sakura_simulation/infrastructure/test_data/test_user_repository.dart';

import '../component/shared/single/bottom_navigation/bottom_navigation.dart';
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
    final user = newUser ?? testUser;
    List pageList = [
      const HomePage(),
      TodoAndTimerPage(user: user),
      CalendarPage(user: user),
      ProfilePage(user: user),
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
