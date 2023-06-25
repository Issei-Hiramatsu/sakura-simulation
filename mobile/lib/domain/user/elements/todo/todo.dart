import 'package:freezed_annotation/freezed_annotation.dart';
part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    @Default(0) int id,
    @Default('') String title,
    @Default(false) bool isCompleted,
    @Default(false) bool isFavorite,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}

//TodoListの抽象クラス
abstract class ITodoListRepository {
  Stream<Map<DateTime, List<Todo>>> fetchAllTodoList();
  Stream<Map<DateTime, List<Todo>>> fetchAllCompletedTodoList();
  Stream<Map<DateTime, List<Todo>>> fetchAllFavoriteTodoList();
  Stream<List<Todo>> fetchTodoListByDate(DateTime date);
  Stream<List<Todo>> fetchLatestTodoList();
  void updateTodoList(DateTime date, List<Todo> todoList);
}
