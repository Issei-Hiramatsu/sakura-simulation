import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/domain/todo/todo.dart';

//オズの魔法使いようの一時的なtodoList
final tempTodoList = <Todo>[
  const Todo(todo: 'イベントに参加する'),
  const Todo(todo: 'duo3.0を進める'),
  const Todo(todo: '数学の宿題を終わらせる'),
];

final tempTodoListProvider = NotifierProvider<TempTodoListNotifier, List<Todo>>(
  () => TempTodoListNotifier(),
);

class TempTodoListNotifier extends Notifier<List<Todo>> {
  @override
  List<Todo> build() => state = tempTodoList;

  void addTodoList(String todo) {
    state = [
      ...state,
      Todo(todo: todo),
    ];
  }
}
