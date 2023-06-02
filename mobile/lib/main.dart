import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'page/sakura_simulation_app.dart';

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
//MVPについて
//自分が行ったタスクと集中した時間をカレンダーごとに可視化することができる
//それをタイマーによって集中する時間を作る(音が鳴るかどうかは検討中)
//タスクについて　現状持ち越しはしない（人はタスクをついためてしまうから)
//終わったタスク, 集中した時間を表示する。
//タイマー終了時にタスクを編集できる時間を作ろう.
//1. 終わったタスクをカレンダーに表示する(4/1だけでいい) -> create_record_system
//2. タイマー終了時に集中した時間を記録する、カレンダーに記載 
//3. タイマー終了時に振り返りの時間を作る（タスクの割合を指定できるようにする（新しいタスクとして作り記録）-> create_timer_review_page
//4. 日付の概念を作る。日付ごとに管理できるようにする。(今日のタスクしか表示されないように)


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

//User -> TimerSettings, TodoList, 
