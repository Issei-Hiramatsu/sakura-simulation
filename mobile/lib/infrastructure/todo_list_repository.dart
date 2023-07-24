import 'package:cloud_firestore/cloud_firestore.dart';

import '/domain/user/elements/todo/todo.dart';

class TodoListRepository extends ITodoListRepository {
  final users = FirebaseFirestore.instance.collection('users');

  @override
  Stream<Map<DateTime, List<Todo>>> fetchAllFavoriteAndCompletedTodoList() {
    // TODO: implement fetchAllFavoriteAndCompletedTodoList
    throw UnimplementedError();
  }

  //  final collection = firestore.collection('library/VTA-中目黒図書館/蔵書');
  //   return collection.snapshots().map(
  //         (QuerySnapshot snapshot) =>
  //             snapshot.docs.map((DocumentSnapshot documentSnapshot) {
  //           final json = documentSnapshot.data() as Map<String, dynamic>;
  //           return BookDocument.fromJson(json);
  //         }).toList(),
  //       );

  @override
  Stream<Map<DateTime, List<Todo>>> fetchAllTodoList() {
    // TODO: implement fetchAllTodoList
    throw UnimplementedError();
  }

  @override
  void addTodo(DateTime date, Todo todo) async {
    final collection = users
        .doc('awi2JjH0SPh5vbORfNxU') //TODO: のちに変更予定
        .collection('todoList')
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
  void updateTodo(DateTime date, Todo todo) async {
    // final collection = users
    //     .collection('users/POxZc3jYWx1VirZjYOyd/todoList')
    //     .doc('$date');
    // await collection.set({'todoList': todoList});
  }

  @override
  void deleteTodo(DateTime date, Todo todo) async {
    // final collection = firestore
    //     .collection('users/POxZc3jYWx1VirZjYOyd/todoList')
    //     .doc('$date');
    //await collection.set({'todoList': todoList});
  }
}
