import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/user_info/user_info.dart';

class UserInfoRepository extends IUserInfoRepository {
  final firestore = FirebaseFirestore.instance;

  @override
  void registerUserInfo(UserInfo userInfo) async {
    CollectionReference users = firestore.collection('users');
    await users.add({
      'id': userInfo.id,
      'email': userInfo.email,
      'userName': userInfo.userName,
      'userImagePath': userInfo.userImagePath,
      'timerDetail': {
        'workTime': userInfo.workTime,
        'breakTime': userInfo.breakTime,
      },
      'accountLevel': '${userInfo.accountLevel}',
      'firstTimeUsing': userInfo.firstTimeUsing,
    });
  }
}
