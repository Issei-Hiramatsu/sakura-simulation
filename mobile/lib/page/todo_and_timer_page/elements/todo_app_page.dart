import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../component/local/todo_app/todo_add_button.dart/todo_add_button.dart';
import '../../../component/shared/single/bottom_navigation/bottom_navigation.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container()),
        TodoAddButton(),
        BottomNavigation(),
      ],
    );
  }
}
