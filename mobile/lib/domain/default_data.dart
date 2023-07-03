import 'package:sakura_simulation/domain/user/elements/timer/timer.dart';

import 'user/elements/account_level/account_level.dart';
import 'user/user.dart';

final defaultData = [
  User(
    id: 1,
    email: 'issei.hiramatsu@gmail.com',
    userName: 'issei',
    accountLevel: AccountLevel.generalUser,
    timerDetail: const Timer(
      workTime: 25,
      breakTime: 5,
      timerLog: [],
    ),
    firstTimeUsing: DateTime.utc(2023, 4, 1),
    todoList: [],
  ),
];
