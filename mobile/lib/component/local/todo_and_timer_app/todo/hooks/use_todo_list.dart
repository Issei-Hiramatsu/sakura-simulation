import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../../infrastructure/test_data/test_todo_list_repository.dart';
import '../../../../../use_case/todo_list_use_case.dart';
import '../../../../../domain/user/elements/todo/todo.dart';

//例のコード
final fetchAllTodoIdList = StreamProvider.family(
  (ref, arg) {
    return TodoListUseCase(todoListRepository: TestTodoListRepository())
        .fetchAllTodoIdList();
  },
);

final updateTodoListProvider = Provider(
    (ref) => TodoListUseCase(todoListRepository: TestTodoListRepository()));

final todoListProvider = NotifierProvider<TodoListNotifier, List<Todo>>(
  () => TodoListNotifier(),
);

class TodoListNotifier extends Notifier<List<Todo>> {
  @override
  List<Todo> build() => state = [];

  void addTodoList(String title) {
    var uuid = const Uuid();
    var newId = uuid.v4();
    //FIXME: 最初にTodoを追加する際に限り既存のIDが読み込めないため新規Todoを追加することができない。
    //そのためIDをチェックする工程がおろそかになってしまっている。
    //checkNewId(newId);
    state = [
      ...state,
      Todo(
        id: newId,
        title: title,
      ),
    ];
    updateTodoList();
  }

//例のコード
  String checkNewId(String newId) {
    ref.watch(fetchAllTodoIdList(ref)).whenData(
      (dataList) {
        var uuid = const Uuid();
        while (dataList.contains(newId)) {
          newId = uuid.v4();
        }
      },
    );
    return newId;
  }

  void deleteTodoList(String id) {
    state.removeWhere((todo) {
      return todo.id == id;
    });
    updateTodoList();
  }

  void toggleIsCompleted(String id) {
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
    state = [
      ...state.where((todo) => !todo.isCompleted),
      ...state.where((todo) => todo.isCompleted),
    ];
    updateTodoList();
  }

  void toggleIsFavorite(String id) {
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
    state = [
      ...state.where((todo) => todo.isFavorite),
      ...state.where((todo) => !todo.isFavorite),
    ];
    updateTodoList();
  }

  void updateTodoList() {
    state = [...state];
    ref.read(updateTodoListProvider).updateTodoList(
          date: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          ),
          todoList: state,
        );
  }
}
