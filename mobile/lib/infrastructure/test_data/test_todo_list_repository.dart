import '../../domain/user/elements/todo/todo.dart';

//テスト用のRepository Firebaseの接続を必要としない
class TestTodoListRepository extends ITodoListRepository {
  @override
  Stream<Map<DateTime, List<Todo>>> fetchAllTodoList() {
    return Stream.value(
      {
        DateTime(2023, 4, 1): [
          const Todo(
            id: 1,
            title: 'イベントに参加する',
            isCompleted: false,
            isFavorite: false,
          ),
          const Todo(
            id: 2,
            title: 'duo3.0を進める',
            isCompleted: false,
            isFavorite: false,
          ),
          const Todo(
            id: 3,
            title: '数学の宿題を終わらせる',
            isCompleted: false,
            isFavorite: false,
          ),
        ],
        DateTime(2023, 4, 3): [
          const Todo(
            id: 4,
            title: 'イベントに参加しない',
            isCompleted: false,
            isFavorite: false,
          ),
          const Todo(
            id: 5,
            title: '英語',
            isCompleted: false,
            isFavorite: false,
          ),
          const Todo(
            id: 6,
            title: 'タスク管理',
            isCompleted: false,
            isFavorite: false,
          ),
        ],
      },
    );
  }

  @override
  Stream<List<Todo>> fetchTodoListByDate(DateTime date) {
    return Stream.value([
      const Todo(
        id: 1,
        title: 'イベントに参加する',
        isCompleted: false,
        isFavorite: false,
      ),
      const Todo(
        id: 2,
        title: 'duo3.0を進める',
        isCompleted: false,
        isFavorite: false,
      ),
      const Todo(
        id: 3,
        title: '数学の宿題を終わらせる',
        isCompleted: false,
        isFavorite: false,
      ),
    ]);
  }
}
