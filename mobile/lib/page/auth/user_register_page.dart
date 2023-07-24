import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';
import '/importer.dart';

import '/component/shared/token/navigator/navigator.dart';
import '/infrastructure/user_repository.dart';
import '/page/sakura_simulation_app.dart';
import '/domain/user/elements/account_level/account_level.dart';
import '/domain/user/elements/timer/timer.dart';
import '/domain/user/user.dart';
import '/use_case/user_use_case.dart';

import '/component/shared/single/shared_app_bar/shared_app_bar.dart';

final registerUserProvider =
    Provider((ref) => UserUseCase(userRepository: UserRepository()));

class UserRegisterPage extends HookConsumerWidget {
  const UserRegisterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = useState('');
    final name = useState('');
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46.sp),
        child: SharedAppBar(titleText: '新規登録', textStyle: titleMedium(white)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {
                email.value = value;
              },
              decoration: const InputDecoration(
                hintText: 'ニックネーム',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {
                name.value = value;
              },
              decoration: const InputDecoration(
                hintText: 'メールアドレスを入力',
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primary),
            onPressed: () {
              ref.read(registerUserProvider).registerUser(
                    user: User(
                      userName: name.value,
                      email: email.value,
                      //TODO: 任意のものに変更できるようにする。
                      userImagePath:
                          'assets/images/kkrn_user_icons/kkrn_icon_user_1.png',
                      timerDetail: const Timer(workTime: 25, breakTime: 5),
                      accountLevel: AccountLevel.generalUser,
                      firstTimeUsing: DateTime.now(),
                    ),
                  );
              NavigatorPushReplacement(context,
                  page: const SakuraSimulationApp());
            },
            child: const Text('登録'),
          )
        ],
      ),
    );
  }
}
