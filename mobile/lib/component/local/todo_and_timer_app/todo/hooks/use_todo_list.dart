import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '/infrastructure/todo_list_repository.dart';
import '/use_case/todo_list_use_case.dart';
import '/domain/user/elements/todo/todo.dart';

final todoProvider = Provider(
    (ref) => TodoListUseCase(todoListRepository: TodoListRepository()));

final todoListProvider = NotifierProvider<TodoListNotifier, List<Todo>>(
  () => TodoListNotifier(),
);

class TodoListNotifier extends Notifier<List<Todo>> {
  @override
  List<Todo> build() => state = [];

  void addTodoList(String title) {
    const uuid = Uuid();
    final newId = uuid.v1();
    final now = DateTime.now();
    state = [
      ...state,
      Todo(
        id: newId,
        title: title,
        createdPeriod: now,
      ),
    ];
    ref.read(todoProvider).addTodo(
          date: now,
          todo: Todo(
            id: newId,
            title: title,
            createdPeriod: now,
          ),
        );
  }

  void deleteTodoList(String id) {
    state.removeWhere((todo) {
      return todo.id == id;
    });
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
  }

  void updateTodoList() {
    state = [...state];
    ref.read(todoProvider).updateTodo(
          date: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          ),
          todo: state.first, //FIXME:
        );
  }
}
