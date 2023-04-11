import 'package:flutter/material.dart';

import '../../../shared/token/color/color.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundLightBlack,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Radio(
          groupValue: '',
          value: '',
          onChanged: (value) {},
        ),
        trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.star)),
        title: Text(text),
      ),
    );
  }
}
