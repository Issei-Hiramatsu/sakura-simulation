import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '/importer.dart';

import '/infrastructure/user_repository.dart';
import '../../use_case/user_settings_use_case.dart';
import '/page/sakura_simulation_app.dart';
import '/component/local/auth/hooks/handle_firebase_auth_error.dart';
import '/component/shared/single/shared_app_bar/shared_app_bar.dart';
import '/component/shared/single/shared_text_field/shared_text_field.dart';
import '/component/shared/token/navigator/navigator.dart';

import 'package:firebase_auth/firebase_auth.dart';

final registerUserInfoProvider = Provider(
    (ref) => UserSettingsUseCase(userRepository: UserSettingsRepository()));

class UserRegisterPage extends HookConsumerWidget {
  const UserRegisterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = FirebaseAuth.instance;
    final email = useState('');
    final password = useState('');

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46.sp),
        child: SharedAppBar(
          titleText: '新規登録',
          automaticallyImplyLeading: true,
          textStyle: titleMedium(white),
        ),
      ),
      body: Column(
        children: [
          SharedTextField(
            hintText: 'メールアドレスを入力',
            onChanged: (value) {
              email.value = value;
            },
          ),
          SharedTextField(
            hintText: 'パスワードを入力',
            obscureText: true,
            onChanged: (value) {
              password.value = value;
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primary),
            onPressed: () async {
              try {
                await auth.createUserWithEmailAndPassword(
                  email: email.value,
                  password: password.value,
                );
                NavigatorPushReplacement(context, page: SakuraSimulationApp());
              } on FirebaseAuthException catch (error) {
                final String errorMessage = handleFirebaseAuthError(error);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(errorMessage)),
                );
              }
            },
            child: const Text('登録'),
          ),
        ],
      ),
    );
  }
}
