import 'package:cloud_firestore/cloud_firestore.dart';

import '/domain/user/elements/todo/todo.dart';

class TodoListRepository extends ITodoListRepository {
  final todoListByUser = FirebaseFirestore.instance
      .collection('users')
      .doc('awi2JjH0SPh5vbORfNxU') //TODO: のちに変更予定
      .collection('todoList');

  @override
  Stream<Map<DateTime, List<Todo>>> fetchAllFavoriteAndCompletedTodoList() {
    // TODO: implement fetchAllFavoriteAndCompletedTodoList
    throw UnimplementedError();
  }

  @override
  Stream<Map<DateTime, List<Todo>>> fetchAllTodoList() {
    // TODO: implement fetchAllTodoList
    throw UnimplementedError();
  }

  @override
  void addTodo(DateTime date, Todo todo) async {
    final collection = todoListByUser
        .doc('${date.year}')
        .collection('${DateTime(date.year, date.month, date.day)}');
    await collection.add({
      'id': todo.id,
      'title': todo.title,
      'isCompleted': todo.isCompleted,
      'isFavorite': todo.isFavorite,
      'createdPeriod': todo.createdPeriod,
    });
  }

  @override
  void deleteTodo(DateTime date, String todoId) async {
    final todoByDate = todoListByUser
        .doc('${date.year}')
        .collection('${DateTime(date.year, date.month, date.day)}');
    todoByDate.where('id', isEqualTo: todoId).get().then(
      (QuerySnapshot snapshot) {
        for (var element in snapshot.docs) {
          todoByDate.doc(element.reference.id).delete();
        }
      },
    );
  }
}
