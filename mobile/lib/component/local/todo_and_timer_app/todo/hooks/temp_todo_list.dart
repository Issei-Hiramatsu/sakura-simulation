import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sakura_simulation/domain/todo/todo.dart';

//オズの魔法使いようの一時的なtodoList
final tempTodoList = <Todo>[
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
];

final tempTodoListProvider = NotifierProvider<TempTodoListNotifier, List<Todo>>(
  () => TempTodoListNotifier(),
);

class TempTodoListNotifier extends Notifier<List<Todo>> {
  @override
  List<Todo> build() => state = tempTodoList;

  void addTodoList(String title) {
    state = [
      ...state,
      Todo(
        id: state.last.id + 1, //簡易的にリスト最終列に1を足す(リストを削除する意向はないので問題ないと思う)
        title: title,
      ),
    ];
  }

  void toggleIsCompleted(int id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            title: todo.title,
            isCompleted: !todo.isCompleted,
            isFavorite: todo.isFavorite,
          )
        else
          todo,
    ];
  }

  void toggleIsFavorite(int id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            title: todo.title,
            isCompleted: todo.isCompleted,
            isFavorite: !todo.isFavorite,
          )
        else
          todo,
    ];
  }
}