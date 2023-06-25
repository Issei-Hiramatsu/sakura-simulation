import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../infrastructure/test_data/test_todo_list_repository.dart';
import '../../../../../use_case/todo_list_use_case.dart';
import '/domain/user/elements/todo/todo.dart';

final updateTodoListProvider = Provider(
    (ref) => TodoListUseCase(todoListRepository: TestTodoListRepository()));

final todoListProvider = NotifierProvider<TodoListNotifier, List<Todo>>(
  () => TodoListNotifier(),
);

class TodoListNotifier extends Notifier<List<Todo>> {
  @override
  List<Todo> build() => state = [];

  void addTodoList(String title) {
    //FIXME: 本来であればDataBaseからfetchLatestTodoListを使用して最終のデータを取得したかったところ
    //データ自体を取得することができなかったので以下で妥協する。
    //どのような形にしても常にNullで帰ってきてしまう。(他のところでは普通に値が返ってきたのでここだけで発生する)
    state = [
      ...state,
      Todo(
        id: testTodoList[testTodoList.keys.last]?.last.id ?? 0 + 1,
        title: title,
      ),
    ];
    updateTodoList();
  }

  void deleteTodoList(int id) {
    state.removeWhere((todo) => todo.id != id);
    updateTodoList();
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
    updateTodoList();
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
    sortTodoListByFavorite();
    updateTodoList();
  }

  void updateTodoList() {
    ref.read(updateTodoListProvider).updateTodoList(
          date: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          ),
          todoList: state,
        );
  }

  void sortTodoListByFavorite() {
    state = [
      ...state.where((todo) => todo.isFavorite),
      ...state.where((todo) => !todo.isFavorite),
    ];
  }
}
