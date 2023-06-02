import 'package:flutter/material.dart';
import '/component/shared/token/color/color.dart';

class SharedAppBar extends StatelessWidget {
  const SharedAppBar({
    super.key,
    required this.titleText,
    required this.textStyle,
    this.leading,
  });

  final String titleText;
  final TextStyle textStyle;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      backgroundColor: primary,
      title: Text(
        titleText,
        style: textStyle,
      ),
    );
  }
}
