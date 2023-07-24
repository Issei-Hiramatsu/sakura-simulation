import 'package:freezed_annotation/freezed_annotation.dart';
part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    @Default('') String id,
    @Default('') String title,
    @Default(false) bool isCompleted,
    @Default(false) bool isFavorite,
    required DateTime createdPeriod,
    DateTime? completedPeriod,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}

//TodoListの抽象クラス
abstract class ITodoListRepository {
  Stream<Map<DateTime, List<Todo>>> fetchAllTodoList();
  Stream<Map<DateTime, List<Todo>>> fetchAllFavoriteAndCompletedTodoList();
  void addTodo(DateTime date, Todo todo);
  void deleteTodo(DateTime date, String todoId);
}
