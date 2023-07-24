import '../domain/user/elements/todo/todo.dart';

//抽象クラスを継承したuseCase domainとUIを接続する
class TodoListUseCase {
  TodoListUseCase({required this.todoListRepository});
  final ITodoListRepository todoListRepository;

  Stream<Map<DateTime, List<Todo>>> fetchAllTodoList() {
    return todoListRepository.fetchAllTodoList();
  }

  Stream<Map<DateTime, List<Todo>>> fetchAllFavoriteAndCompletedTodoList() {
    return todoListRepository.fetchAllFavoriteAndCompletedTodoList();
  }

  void addTodo({required DateTime date, required Todo todo}) {
    return todoListRepository.addTodo(date, todo);
  }

  void deleteTodo({required DateTime date, required String todoId}) {
    return todoListRepository.deleteTodo(date, todoId);
  }
}
