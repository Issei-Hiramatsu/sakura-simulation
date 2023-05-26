import 'package:sakura_simulation/domain/user/user.dart';

final defaultData = [
  User(
    id: 1, //アプリ内ユーザ識別
    email: 'issei.hiramatsu@gmail.com', //ユーザ識別よう
    userName: 'issei',
    userImagePath: '/assets/images/kkrn_user_icons/kkrn_icon_user_1.png',
    firstTimeUsing: DateTime.utc(2023, 4, 1),
  )
];
