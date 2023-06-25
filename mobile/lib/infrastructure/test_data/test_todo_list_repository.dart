import '../../domain/user/elements/todo/todo.dart';

//テスト用のRepository Firebaseの接続を必要としない
final testTodoList = {
  DateTime(2023, 4, 1): [
    const Todo(
      id: 1,
      title: 'イベントに参加する',
      isCompleted: true,
      isFavorite: true,
    ),
    const Todo(
      id: 2,
      title: 'duo3.0を進める',
      isCompleted: true,
      isFavorite: true,
    ),
    const Todo(
      id: 3,
      title: '数学の宿題を終わらせる',
      isCompleted: true,
      isFavorite: true,
    ),
  ],
  DateTime(2023, 4, 3): [
    const Todo(
      id: 4,
      title: 'イベントに参加しない',
      isCompleted: true,
      isFavorite: true,
    ),
    const Todo(
      id: 5,
      title: '英語',
      isCompleted: true,
      isFavorite: true,
    ),
    const Todo(
      id: 6,
      title: 'タスク管理',
      isCompleted: true,
      isFavorite: true,
    ),
  ],
};

class TestTodoListRepository extends ITodoListRepository {
  @override
  Stream<Map<DateTime, List<Todo>>> fetchAllTodoList() {
    return Stream.value(testTodoList);
  }

  @override
  Stream<Map<DateTime, List<Todo>>> fetchAllCompletedTodoList() {
    Map<DateTime, List<Todo>> completedTodoList = {};
    testTodoList.forEach((date, todo) {
      List<Todo> completedTodo =
          todo.where((todo) => todo.isCompleted).toList();
      if (completedTodo.isNotEmpty) {
        completedTodoList[date] = completedTodo;
      }
    });
    return Stream.value(completedTodoList);
  }

  @override
  Stream<List<Todo>> fetchTodoListByDate(DateTime date) {
    return Stream.value(testTodoList[date] ?? []);
  }

  @override
  Stream<List<Todo>> fetchLatestTodoList() {
    final sortedList = testTodoList.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));
    final latestList = sortedList.last;
    return Stream.value(testTodoList[latestList.key] ?? []);
  }

  @override
  void updateTodoList(DateTime date, List<Todo> todoList) {
    testTodoList[date] = todoList;
  }
}
