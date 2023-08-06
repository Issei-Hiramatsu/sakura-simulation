import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sakura_simulation/page/auth/user_login_page.dart';
import 'package:sakura_simulation/page/auth/user_register_page.dart';
import 'package:sakura_simulation/page/sakura_simulation_app.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('ja');
    return ScreenUtilInit(
        //FIXME:
        designSize: const Size(390, 844),
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // TODO: スプラッシュ画面などに書き換えても良い
                  return const SizedBox();
                }
                if (snapshot.hasData) {
                  //   print(snapshot);
                  // User が null でなない、つまりサインイン済みのホーム画面へ
                  return const SakuraSimulationApp();
                }
                // User が null である、つまり未サインインのサインイン画面へ
                return const UserLoginPage();
              },
            ),

            // const SakuraSimulationApp(),
          );
        });
  }
}


//バグ報告 googleフォームを設置する
//改めてモバイルだけの対応とする <-　専用のプルリク

//テストリリースへ　一斉リニューアル
