import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../component/local/todo_app/todo_add_button.dart/todo_add_button.dart';
import '../../component/shared/single/bottom_navigation/bottom_navigation.dart';

class TodoAndTimerPage extends StatelessWidget {
  const TodoAndTimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          TodoAddButton(),
          BottomNavigation(),
        ],
      ),
    );
  }
}
