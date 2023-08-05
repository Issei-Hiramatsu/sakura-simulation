import '/domain/user_info/elements/todo/todo.dart';

//抽象クラスを継承したuseCase domainとUIを接続する
class TodoListUseCase {
  TodoListUseCase({required this.todoListRepository});
  final ITodoListRepository todoListRepository;

  Stream<List<Todo>> fetchAllTodoList() {
    return todoListRepository.fetchAllTodoList();
  }

  Stream<List<Todo>> fetchAllFavoriteAndCompletedTodoList() {
    return todoListRepository.fetchAllFavoriteAndCompletedTodoList();
  }

  void addTodo({required Todo todo}) {
    return todoListRepository.addTodo(todo);
  }

  void updateTodo({required Todo todo}) {
    return todoListRepository.updateTodo(todo);
  }

  void deleteTodo({required String todoId}) {
    return todoListRepository.deleteTodo(todoId);
  }

  void toggleIsCompleted({required Todo todo}) {
    return todoListRepository.toggleIsCompleted(todo);
  }

  void toggleIsFavorite({required Todo todo}) {
    return todoListRepository.toggleIsFavorite(todo);
  }
}
