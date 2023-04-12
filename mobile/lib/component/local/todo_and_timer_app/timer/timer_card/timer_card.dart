import 'package:flutter/material.dart';

import '../../../../shared/token/color/color.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundLightBlack,
      child: ListTile(
        trailing:
            IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_right)),
        title: Text(text),
      ),
    );
  }
}
