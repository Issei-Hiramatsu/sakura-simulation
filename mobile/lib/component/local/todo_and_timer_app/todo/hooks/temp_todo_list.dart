import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/domain/todo/todo.dart';

//オズの魔法使いようの一時的なtodoList
final tempTodoList = <Todo>[
  const Todo(
    id: '1',
    todo: 'イベントに参加する',
    isCompleted: false,
    isFavorite: false,
  ),
  const Todo(
    id: '2',
    todo: 'duo3.0を進める',
    isCompleted: false,
    isFavorite: false,
  ),
  const Todo(
    id: '3',
    todo: '数学の宿題を終わらせる',
    isCompleted: false,
    isFavorite: false,
  ),
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

  void toggleIsCompleted(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            todo: todo.todo,
            isCompleted: !todo.isCompleted,
            isFavorite: todo.isFavorite,
          )
        else
          todo,
    ];
  }
}
