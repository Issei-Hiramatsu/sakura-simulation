import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'page/sakura_simulation_app.dart';
import 'page/todo_and_timer_page/elements/timer_app/elements/pomodoro_timer_page/pomodoro_timer_page.dart';

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
            home: const SakuraSimulationApp(),
          );
        });
  }
}

//ここからの大まかな流れ{ 
//1. ユーザのドメイン作成(id, 個人情報, 開始時刻など)
// うまく機能とUIで分けることができた(consumerStatefulWidgetをNotifierで機能にした（initStateは要らなかったかも...)
//2. 仮想データベースの作成(データベースに接続しなくてもいい　デフォルトの状態)

//3. タイマー記録&カレンダー表示 (ドメインはこの時点までに用意する)
//4. メニューの部分をcomingSoonにしたい
//5. 対応する予定のTodoを表示 右下のボタンでもその日付に追加できるように（MVP外）
//}

//タイマーについて　
//二種類のタイマーを用意　ポモドーロは　時間計測とTodoリストの表示
//集中は3分タイマーを設置　3分後音が鳴ること（今回は作成不要）bgmがだんだんと小さくなっていくことが挙げられる　スマホを動かしたら終了
//ここは作成した桜の場所を使用する
//本当はアニメーションやgifなんかを使ってみたいが　絵やアニメを私が作成できず断念。他に感じらるものはないかと考え　動画風写真に至った。少々物足りないだろうが　ゆったりとした成長を楽しめるのはいいと思う。

//またBgmの工夫も明記

