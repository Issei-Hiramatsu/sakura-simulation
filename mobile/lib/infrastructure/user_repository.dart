import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sakura_simulation/domain/user/user.dart';

class UserRepository extends IUserRepository {
  final firestore = FirebaseFirestore.instance;

  @override
  void registerUser(User user) async {
    CollectionReference users = firestore.collection('users');
    await users.add({
      'id': user.id,
      'email': user.email,
      'userName': user.userName,
      'userImagePath': user.userImagePath,
      'timerDetail': {
        'workTime': user.timerDetail.workTime,
        'breakTime': user.timerDetail.breakTime,
        'timerLog': user.timerDetail.timerLog,
      },
      'accountLevel': user.accountLevel.toString(),
      'todoList': user.todoList,
      'firstTimeUsing': user.firstTimeUsing,
    });
  }
}
