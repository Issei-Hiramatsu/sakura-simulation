// import '../domain/user/elements/todo/todo.dart';

////データベースを変換している
// class TodoListRepository extends ITodoListRepository {
//   final firestore = FirebaseFirestore.instance;

//   void registerClass(Class classInfo) {
//     final collection = firestore.doc(
//       //ここに日付
//       'all_class/VTA_class/2022/first_semester/all_class/${classInfo.name}',
//     );
//     collection.set({
//       'id': collection.id,
//       'name': classInfo.name,
//       'overView': classInfo.overView,
//       'goalPoint': classInfo.goalPoint,
//       'selectableBaseClass': 'false',
//       'frameCount': classInfo.frameCount,
//       'goalRequirements': classInfo.goalRequirements,
//       'baseClass': classInfo.baseClass,
//       'classImgUrl': classInfo.classImgUrl,
//       'document': classInfo.document,
//       'studentIdList': classInfo.studentIdList
//           .map((studentId) => studentId.id.toString())
//           .toList(),
//       'teacherIdList': classInfo.teacherIdList
//           .map((teacherId) => teacherId.id.toString())
//           .toList(),
//     });
//   }

//   Stream<List<Todo>> fetchTodoList() {
//     final collection = firestore.collection('my_class').snapshots();
//     return collection.map<List<Class>>(
//       (QuerySnapshot snapshot) => snapshot.docs
//           .map(
//             (DocumentSnapshot doc) =>
//                 Class.fromJson(doc.data() as Map<String, dynamic>),
//           )
//           .toList(),
//     );
//   }
// }
