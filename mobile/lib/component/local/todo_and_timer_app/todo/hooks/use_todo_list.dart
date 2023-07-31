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
  final now = DateTime.now();

  void addTodoList(String title) {
    const uuid = Uuid();
    final newId = uuid.v1();
    state = [
      ...state,
      Todo(
        id: newId,
        title: title,
        createdPeriod: now,
      ),
    ];
    ref.read(todoProvider).addTodo(
          todo: Todo(
            id: newId,
            title: title,
            createdPeriod: now,
          ),
        );
  }

  void deleteTodoList(String todoId) {
    state.removeWhere((todo) {
      return todo.id == todoId;
    });
    ref.read(todoProvider).deleteTodo(
          todoId: todoId,
        );
    updateTodoList();
  }

  void toggleIsCompleted(Todo todo) {
    state = [
      for (final Todo todoState in state)
        if (todoState.id == todo.id)
          Todo(
            id: todoState.id,
            title: todoState.title,
            isCompleted: !todoState.isCompleted,
            isFavorite: todoState.isFavorite,
            createdPeriod: todoState.createdPeriod,
            completedPeriod: DateTime.now(),
          )
        else
          todoState,
    ];

    state = [
      ...state.where((todo) => !todo.isCompleted),
      ...state.where((todo) => todo.isCompleted),
    ];

    ref.read(todoProvider).toggleIsCompleted(todo: todo);
  }

  void toggleIsFavorite(Todo todo) {
    state = [
      for (final Todo todoState in state)
        if (todoState.id == todo.id)
          Todo(
            id: todoState.id,
            title: todoState.title,
            isCompleted: todoState.isCompleted,
            isFavorite: !todoState.isFavorite,
            createdPeriod: todoState.createdPeriod,
          )
        else
          todoState
    ];

    ref.read(todoProvider).toggleIsFavorite(todo: todo);
  }

  void updateTodoList() {
    state = [...state];
  }
}
