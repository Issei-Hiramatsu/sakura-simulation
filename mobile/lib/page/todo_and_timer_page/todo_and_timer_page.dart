import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoAndTimerPage extends StatelessWidget {
  const TodoAndTimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'すべて'),
                Tab(text: 'その他'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
