import 'package:sakura_simulation/domain/user/elements/timer/timer.dart';

import '../../domain/user/elements/account_level/account_level.dart';
import '../../domain/user/user.dart';

final testUser = User(
  id: 1,
  email: 'guest@gmail.com',
  userName: 'guest',
  userImagePath: 'assets/images/kkrn_user_icons/kkrn_icon_user_3.png',
  accountLevel: AccountLevel.generalUser,
  timerDetail: const Timer(
    workTime: 25,
    breakTime: 5,
    timerLog: {},
  ),
  firstTimeUsing: DateTime.utc(2023, 4, 1),
  todoList: [],
);

User? newUser;

class TestUserRepository extends IUserRepository {
  @override
  void registerUser(User user) {
    newUser = user;
  }
}
