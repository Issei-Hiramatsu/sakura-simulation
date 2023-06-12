import '../../domain/user/elements/todo/todo.dart';

//テスト用のRepository Firebaseの接続を必要としない
class TestTodoListRepository extends ITodoListRepository {
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
