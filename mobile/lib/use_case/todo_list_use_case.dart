import '../domain/user/elements/todo/todo.dart';

//抽象クラスを継承したuseCase domainとUIを接続する
class TodoListUseCase {
  TodoListUseCase({required this.todoListRepository});
  final ITodoListRepository todoListRepository;

  Stream<List<Todo>> fetchTodoListByDate({required DateTime date}) {
    return todoListRepository.fetchTodoListByDate(date);
  }
}
