import 'package:sakura_simulation/domain/user/elements/account_level/account_level.dart';

import 'user/user.dart';
import 'user/elements/timer_settings/timer_settings.dart';
import 'user/elements/todo/todo.dart';

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
    todoList: {
      '4/1': [
        const Todo(
          id: 1,
          title: 'イベントに参加する',
          isCompleted: false,
          isFavorite: false,
        ),
        const Todo(
          id: 2,
          title: 'duo3.0を進める',
          isCompleted: false,
          isFavorite: false,
        ),
        const Todo(
          id: 3,
          title: '数学の宿題を終わらせる',
          isCompleted: false,
          isFavorite: false,
        ),
      ],
      '4/2': [
        const Todo(
          id: 4,
          title: 'イベントの感想を書く',
          isCompleted: false,
          isFavorite: false,
        ),
        const Todo(
          id: 5,
          title: '文法特急を読む',
          isCompleted: false,
          isFavorite: false,
        ),
        const Todo(
          id: 6,
          title: '世界史の宿題を終わらせる',
          isCompleted: false,
          isFavorite: false,
        ),
      ]
    },
  ),
  //User(), (仮　セカンドユーザー)
];
