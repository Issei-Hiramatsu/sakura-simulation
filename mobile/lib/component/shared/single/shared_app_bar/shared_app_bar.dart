import 'package:flutter/material.dart';
import 'package:sakura_simulation/component/shared/token/color/color.dart';

import '../../token/text_style/text_style.dart';

class SharedAppBar extends StatelessWidget {
  const SharedAppBar(
      {super.key, required this.titleText, required this.textStyle});

  final String titleText;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primary,
      title: Text(
        titleText,
        style: textStyle,
      ),
    );
  }
}
