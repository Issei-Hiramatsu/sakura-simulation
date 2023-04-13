import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/domain/todo/todo.dart';

//オズの魔法使いようの一時的なtodoList
final tempTodoList = <Todo>[
  const Todo(todo: 'イベントに参加する'),
  const Todo(todo: 'duo3.0を進める'),
  const Todo(todo: '数学の宿題を終わらせる'),
];

final tempNewTodoList = <Todo>[
  const Todo(todo: 'イベントに参加する'),
  const Todo(todo: 'duo3.0を進める'),
  const Todo(todo: '数学の宿題を終わらせる'),
  const Todo(todo: 'aaa'),
];

class TempTodoListNotifier extends StateNotifier<List> {
  TempTodoListNotifier(List initialState) : super(initialState);
  void addTodoList() {
    state = tempNewTodoList;
  }
}

final tempTodoListProvider = StateNotifierProvider<TempTodoListNotifier, List>(
    (ref) => TempTodoListNotifier(tempTodoList));
