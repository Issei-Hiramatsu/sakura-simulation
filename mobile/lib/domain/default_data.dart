import 'package:sakura_simulation/component/local/todo_and_timer_app/todo/todo_list/todo_list.dart';
import 'package:sakura_simulation/domain/account_level/account_level.dart';
import 'package:sakura_simulation/domain/todo/todo.dart';
import 'package:sakura_simulation/domain/user/elements/timer_settings/timer_settings.dart';
import 'package:sakura_simulation/domain/user/user.dart';

final defaultData = AccountLevel(
  premiumUser: [
    User(
      id: 1,
      email: 'issei.hiramatsu@gmail.com',
      userName: 'issei',
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
            id: 1,
            title: 'イベントの感想を書く',
            isCompleted: false,
            isFavorite: false,
          ),
          const Todo(
            id: 2,
            title: '文法特急を読む',
            isCompleted: false,
            isFavorite: false,
          ),
          const Todo(
            id: 3,
            title: '世界史の宿題を終わらせる',
            isCompleted: false,
            isFavorite: false,
          ),
        ]
      },
    )
  ],
);
