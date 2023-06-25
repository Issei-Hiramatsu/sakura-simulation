import '../domain/user/elements/todo/todo.dart';

//抽象クラスを継承したuseCase domainとUIを接続する
class TodoListUseCase {
  TodoListUseCase({required this.todoListRepository});
  final ITodoListRepository todoListRepository;

  Stream<Map<DateTime, List<Todo>>> fetchAllTodoList() {
    return todoListRepository.fetchAllTodoList();
  }

  Stream<List<String>> fetchAllTodoIdList() {
    return todoListRepository.fetchAllTodoIdList();
  }

  Stream<Map<DateTime, List<Todo>>> fetchAllFavoriteAndCompletedTodoList() {
    return todoListRepository.fetchAllFavoriteAndCompletedTodoList();
  }

  void updateTodoList({required DateTime date, required List<Todo> todoList}) {
    return todoListRepository.updateTodoList(date, todoList);
  }
}
