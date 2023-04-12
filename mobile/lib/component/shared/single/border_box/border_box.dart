import 'package:flutter/material.dart';

class HorizontalBorderBox extends StatelessWidget {
  const HorizontalBorderBox({
    super.key,
    required this.child,
    required this.borderColor,
    required this.borderWidth,
  });

  final Widget child;
  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
      ),
      child: child,
    );
  }
}
