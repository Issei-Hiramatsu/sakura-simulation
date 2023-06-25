import '../../domain/user/elements/todo/todo.dart';

//テスト用のRepository Firebaseの接続を必要としない
final testTodoList = {
  DateTime(2023, 4, 1): [
    const Todo(
      id: '1',
      title: 'イベントに参加する',
      isCompleted: false,
      isFavorite: false,
    ),
    const Todo(
      id: '2',
      title: 'duo3.0を進める',
      isCompleted: false,
      isFavorite: true,
    ),
    const Todo(
      id: '3',
      title: '数学の宿題を終わらせる',
      isCompleted: true,
      isFavorite: true,
    ),
  ],
  DateTime(2023, 4, 3): [
    const Todo(
      id: '4',
      title: 'イベントに参加しない',
      isCompleted: true,
      isFavorite: true,
    ),
    const Todo(
      id: '5',
      title: '英語',
      isCompleted: true,
      isFavorite: true,
    ),
    const Todo(
      id: '6',
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
  Stream<List<String>> fetchAllTodoIdList() {
    List<String> todoIdList = [];
    for (var todoList in testTodoList.values) {
      for (var todo in todoList) {
        todoIdList.add(todo.id.toString());
      }
    }
    return Stream.value(todoIdList);
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
  Stream<Map<DateTime, List<Todo>>> fetchAllFavoriteTodoList() {
    Map<DateTime, List<Todo>> favoriteTodoList = {};
    testTodoList.forEach((date, todo) {
      List<Todo> favoriteTodo = todo.where((todo) => todo.isFavorite).toList();
      if (favoriteTodo.isNotEmpty) {
        favoriteTodoList[date] = favoriteTodo;
      }
    });
    return Stream.value(favoriteTodoList);
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
