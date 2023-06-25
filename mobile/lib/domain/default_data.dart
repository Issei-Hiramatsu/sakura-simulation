import 'user/elements/account_level/account_level.dart';
import 'user/user.dart';
import 'user/elements/timer_settings/timer_settings.dart';

final defaultData = [
  User(
      id: 1,
      email: 'issei.hiramatsu@gmail.com',
      userName: 'issei',
      accountLevel: AccountLevel.generalUser,
      firstTimeUsing: DateTime.utc(2023, 4, 1),
      timerSettings: const TimerSettings(
        workTime: 25,
        breakTime: 5,
      ),
      todoList: []),
];
