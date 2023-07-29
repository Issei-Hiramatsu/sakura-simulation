import 'package:cloud_firestore/cloud_firestore.dart';

import '/domain/user/elements/todo/todo.dart';

class TodoListRepository extends ITodoListRepository {
  final todoListByUser = FirebaseFirestore.instance
      .collection('users')
      .doc('awi2JjH0SPh5vbORfNxU') //TODO: のちに変更予定
      .collection('todoList');

  @override
  Stream<List<Todo>> fetchAllFavoriteAndCompletedTodoList(DateTime date) {
    final collection = todoListByUser.snapshots();

    return collection.map(
      (QuerySnapshot snapshot) =>
          snapshot.docs.map((DocumentSnapshot documentSnapshot) {
        final json = documentSnapshot.data() as Map<String, dynamic>;
        return Todo(
            id: json['id'],
            title: json['title'],
            isCompleted: json['isCompleted'],
            isFavorite: json['isFavorite'],
            createdPeriod: DateTime.now(), //FIXME: ここの問題
            completedPeriod: DateTime.now());
      }).toList(),
    );
  }

  @override
  Stream<List<Todo>> fetchAllTodoList(DateTime date) {
    final collection = todoListByUser.snapshots();

    return collection.map(
      (QuerySnapshot snapshot) =>
          snapshot.docs.map((DocumentSnapshot documentSnapshot) {
        final json = documentSnapshot.data() as Map<String, dynamic>;
        return Todo(
            id: json['id'],
            title: json['title'],
            isCompleted: json['isCompleted'],
            isFavorite: json['isFavorite'],
            createdPeriod: DateTime.now(), //FIXME: ここの問題
            completedPeriod: DateTime.now());
      }).toList(),
    );
  }

  @override
  void addTodo(DateTime date, Todo todo) async {
    final collection = todoListByUser;
    await collection.add({
      'id': todo.id,
      'title': todo.title,
      'isCompleted': todo.isCompleted,
      'isFavorite': todo.isFavorite,
      'createdPeriod': todo.createdPeriod,
    });
  }

  @override
  void updateTodo(DateTime date, Todo todo) async {}

  @override
  void deleteTodo(DateTime date, String todoId) async {
    final collection = todoListByUser;
    collection.where('id', isEqualTo: todoId).get().then(
      (QuerySnapshot snapshot) {
        for (var element in snapshot.docs) {
          collection.doc(element.reference.id).delete();
        }
      },
    );
  }

  @override
  void toggleIsCompleted(DateTime date, Todo todo) {
    final collection = todoListByUser;
    collection.where('id', isEqualTo: todo.id).get().then(
      (QuerySnapshot snapshot) {
        for (var element in snapshot.docs) {
          collection.doc(element.reference.id).update({
            'isCompleted': !todo.isCompleted,
            'completedPeriod': DateTime.now(),
          });
        }
      },
    );
  }

  @override
  void toggleIsFavorite(DateTime date, Todo todo) {
    final collection = todoListByUser;
    collection
        .where('id', isEqualTo: todo.id)
        .get()
        .then((QuerySnapshot snapshot) {
      for (var element in snapshot.docs) {
        collection.doc(element.reference.id).update({
          'isFavorite': !todo.isFavorite,
        });
      }
    });
  }
}
