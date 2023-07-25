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

  void updateTodo({required DateTime date, required Todo todo}) {
    return todoListRepository.updateTodo(date, todo);
  }

  void deleteTodo({required DateTime date, required String todoId}) {
    return todoListRepository.deleteTodo(date, todoId);
  }

  void toggleIsCompleted({required DateTime date, required Todo todo}) {
    return todoListRepository.toggleIsCompleted(date, todo);
  }

  void toggleIsFavorite({required DateTime date, required Todo todo}) {
    return todoListRepository.toggleIsFavorite(date, todo);
  }
}
