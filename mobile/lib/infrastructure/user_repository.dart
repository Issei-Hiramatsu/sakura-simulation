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
        'workTime': user.workTime,
        'breakTime': user.breakTime,
      },
      'accountLevel': '${user.accountLevel}',
      'firstTimeUsing': user.firstTimeUsing,
    });
  }
}
