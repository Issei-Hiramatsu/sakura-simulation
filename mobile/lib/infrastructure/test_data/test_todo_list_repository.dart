import '../../domain/user/elements/todo/todo.dart';

//テスト用のRepository Firebaseの接続を必要としない
final testTodoList = {
  DateTime(2023, 4, 1): [
    Todo(
        id: '1',
        title: 'イベントに参加する',
        isCompleted: false,
        isFavorite: false,
        createdPeriod: DateTime(2023, 4, 1, 9, 0)),
    Todo(
        id: '2',
        title: 'duo3.0を進める',
        isCompleted: false,
        isFavorite: true,
        createdPeriod: DateTime(2023, 4, 1, 10, 10)),
    Todo(
        id: '3',
        title: '数学の宿題を終わらせる',
        isCompleted: true,
        isFavorite: true,
        createdPeriod: DateTime(2023, 4, 1, 12, 40)),
  ],
  DateTime(2023, 4, 3): [
    Todo(
        id: '4',
        title: 'イベントに参加しない',
        isCompleted: true,
        isFavorite: true,
        createdPeriod: DateTime(2023, 4, 3, 9, 20)),
    Todo(
        id: '5',
        title: '英語',
        isCompleted: true,
        isFavorite: true,
        createdPeriod: DateTime(2023, 4, 3, 14, 0)),
    Todo(
        id: '6',
        title: 'タスク管理',
        isCompleted: true,
        isFavorite: true,
        createdPeriod: DateTime(2023, 4, 3, 16, 0)),
  ],
};

class TestTodoListRepository extends ITodoListRepository {
  @override
  Stream<Map<DateTime, List<Todo>>> fetchAllTodoList() {
    return Stream.value(testTodoList);
  }

  @override
  Stream<Map<DateTime, List<Todo>>> fetchAllFavoriteAndCompletedTodoList() {
    Map<DateTime, List<Todo>> favoriteAndCompletedTodoList = {};
    testTodoList.forEach((date, todo) {
      List<Todo> favoriteAndCompletedTodo =
          todo.where((todo) => todo.isCompleted || todo.isFavorite).toList();
      if (favoriteAndCompletedTodo.isNotEmpty) {
        favoriteAndCompletedTodoList[date] = favoriteAndCompletedTodo;
      }
    });
    return Stream.value(favoriteAndCompletedTodoList);
  }

  @override
  void addTodo(DateTime date, Todo todo) {
    testTodoList[date] = [...testTodoList[date] ?? [], todo];
    print(testTodoList[date]);
  }

  @override
  void updateTodoList(DateTime date, List<Todo> todoList) {
    testTodoList[date] = todoList;
  }

  @override
  void deleteTodo(DateTime date, Todo todo) {
    // TODO: implement deleteTodo
  }

  @override
  void updateTodo(DateTime date, Todo todo) {
    // TODO: implement updateTodo
  }
}
