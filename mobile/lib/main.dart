import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'component/local/todo_and_timer_app/timer/pomodoro_timer/hooks/use_pomodoro_timer.dart';

void main() {
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
            home: TimerSamplePage(),
          );
        });
  }
}


//対応する項目に色がつくように変更する
//各ページに対応するページを配置する　未作成の場合は概要を記載しておく。

//タイマーについて　
//二種類のタイマーを用意　ポモドーロは　時間計測とTodoリストの表示
//集中は3分タイマーを設置　3分後音が鳴ること（今回は作成不要）bgmがだんだんと小さくなっていくことが挙げられる　スマホを動かしたら終了
//ここは作成した桜の場所を使用する
//本当はアニメーションやgifなんかを使ってみたいが　絵やアニメを私が作成できず断念。他に感じらるものはないかと考え　動画風写真に至った。少々物足りないだろうが　ゆったりとした成長を楽しめるのはいいと思う。

//またBgmの工夫も明記

//イベント要素について
//AppBarにLv やアイテム数の表示　左上アイコンの設置
//灰？　成長剤？

//ポモドーロ todoも付いている
//集中　後ろが桜の背景