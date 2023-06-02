import 'package:flutter/material.dart';
import '/component/shared/token/color/color.dart';

class SharedAppBar extends StatelessWidget {
  const SharedAppBar({
    super.key,
    required this.titleText,
    required this.textStyle,
    this.leading,
    this.automaticallyImplyLeading = false,
  });

  final String titleText;
  final TextStyle textStyle;
  final Widget? leading;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: leading,
      backgroundColor: primary,
      title: Text(
        titleText,
        style: textStyle,
      ),
    );
  }
}
