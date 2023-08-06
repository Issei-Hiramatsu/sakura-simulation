import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sakura_simulation/infrastructure/user_repository.dart';

import '../domain/todo/todo.dart';

class TodoListRepository extends ITodoListRepository {
  @override
  Stream<List<Todo>> fetchAllFavoriteAndCompletedTodoList() {
    throw UnimplementedError();
  }

  @override
  Stream<List<Todo>> fetchAllTodoList() async* {
    final collection = await getUserDocId().then(
      (userDocId) => FirebaseFirestore.instance
          .collection('users')
          .doc(userDocId)
          .collection('todoList')
          .orderBy('createdPeriod', descending: true)
          .snapshots(),
    );

    yield* collection.map(
      (QuerySnapshot snapshot) =>
          snapshot.docs.map((DocumentSnapshot documentSnapshot) {
        final json = documentSnapshot.data() as Map<String, dynamic>;

        final createdTimestamp = json['createdPeriod'];
        DateTime createdPeriod = DateTime.now();
        if (createdTimestamp is Timestamp) {
          createdPeriod = createdTimestamp.toDate();
        }

        final completedTimestamp = json['completedPeriod'];
        DateTime completedPeriod = DateTime(0);
        if (completedTimestamp is Timestamp) {
          completedPeriod = completedTimestamp.toDate();
        }
        return Todo(
          id: json['id'],
          title: json['title'],
          isCompleted: json['isCompleted'],
          isFavorite: json['isFavorite'],
          createdPeriod: createdPeriod,
          completedPeriod: completedPeriod,
        );
      }).toList(),
    );
  }

  @override
  void addTodo(Todo todo) async {
    final collection = await getUserDocId().then(
      (userDocId) => FirebaseFirestore.instance
          .collection('users')
          .doc(userDocId)
          .collection('todoList'),
    );
    await collection.add({
      'id': todo.id,
      'title': todo.title,
      'isCompleted': todo.isCompleted,
      'isFavorite': todo.isFavorite,
      'createdPeriod': todo.createdPeriod,
    });
  }

  @override
  void updateTodo(Todo todo) async {}

  @override
  void deleteTodo(String todoId) async {
    final collection = await getUserDocId().then(
      (userDocId) => FirebaseFirestore.instance
          .collection('users')
          .doc(userDocId)
          .collection('todoList'),
    );
    collection.where('id', isEqualTo: todoId).get().then(
      (QuerySnapshot snapshot) {
        for (var element in snapshot.docs) {
          collection.doc(element.reference.id).delete();
        }
      },
    );
  }

  @override
  void toggleIsCompleted(Todo todo) async {
    final collection = await getUserDocId().then(
      (userDocId) => FirebaseFirestore.instance
          .collection('users')
          .doc(userDocId)
          .collection('todoList'),
    );
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
  void toggleIsFavorite(Todo todo) async {
    final collection = await getUserDocId().then(
      (userDocId) => FirebaseFirestore.instance
          .collection('users')
          .doc(userDocId)
          .collection('todoList'),
    );
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
