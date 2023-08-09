import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../component/shared/single/bottom_navigation/bottom_navigation.dart';
import '../component/shared/single/shared_circular_progress_indicator/shared_circular_progress_indicator.dart';
import '../infrastructure/user_repository.dart';
import '../use_case/user_settings_use_case.dart';
import '/page/home/home_page.dart';
import '/page/todo_and_timer_page/todo_and_timer_page.dart';
import '/page/calendar/calendar_page.dart';
import '/page/profile/profile_page.dart';

final fetchUserSettings = StreamProvider(
  (ref) {
    return UserSettingsUseCase(userSettingsRepository: UserSettingsRepository())
        .fetchUserSettings();
  },
);

class SakuraSimulationApp extends HookConsumerWidget {
  const SakuraSimulationApp({
    this.pageIndex = 0,
    Key? key,
  }) : super(key: key);

  final int pageIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(pageIndex);
    return ref.watch(fetchUserSettings).when(
          data: (userSettings) {
            final pageList = [
              const HomePage(),
              const TodoAndTimerPage(),
              CalendarPage(userSettings: userSettings),
              ProfilePage(userSettings: userSettings),
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
          },
          error: (error, stackTrace) {
            return const Scaffold(
                body: Center(child: Text('予期せぬエラーが発生いたしました。開発者が対応いたします')));
          },
          loading: () => const Scaffold(
            body: SharedCircularProgressIndicator(),
          ),
        );
  }
}
