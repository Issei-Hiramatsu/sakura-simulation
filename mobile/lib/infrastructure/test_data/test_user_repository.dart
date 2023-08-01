import '../../domain/user/elements/account_level/account_level.dart';
import '../../domain/user/user.dart';

final testUser = User(
  id: 1,
  email: 'guest@gmail.com',
  userName: 'guest',
  userImagePath: 'assets/images/kkrn_user_icons/kkrn_icon_user_3.png',
  accountLevel: AccountLevel.generalUser,
  workTime: 25,
  breakTime: 5,
  firstTimeUsing: DateTime.utc(2023, 4, 1),
);

User? newUser;

class TestUserRepository extends IUserRepository {
  @override
  void registerUser(User user) {
    newUser = user;
  }
}
