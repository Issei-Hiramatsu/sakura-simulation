import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/domain/default_data.dart';
import '/domain/account_level/elements/user/elements/todo/todo.dart';

final todoListProvider = NotifierProvider<TodoListNotifier, List<Todo>>(
  () => TodoListNotifier(),
);

class TodoListNotifier extends Notifier<List<Todo>> {
  @override
  List<Todo> build() => state = defaultData.premiumUser[0].todoList['4/1']!;

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