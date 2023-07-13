import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../../infrastructure/test_data/test_todo_list_repository.dart';
import '../../../../../use_case/todo_list_use_case.dart';
import '../../../../../domain/user/elements/todo/todo.dart';

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
    var newId = uuid.v1();
    state = [
      ...state,
      Todo(
        id: newId,
        title: title,
        createdPeriod: DateTime.now(),
      ),
    ];
    updateTodoList();
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
            createdPeriod: todo.createdPeriod,
            completedPeriod: DateTime.now(),
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
            createdPeriod: todo.createdPeriod,
            completedPeriod: todo.completedPeriod,
          )
        else
          todo,
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
