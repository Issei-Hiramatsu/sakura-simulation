import 'package:flutter/material.dart';

import '../../../../../importer.dart';

class FloatingCircleButton extends StatelessWidget {
  const FloatingCircleButton(
      {super.key, required this.icon, required this.onPressed});

  final Icon icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: primary,
      child: icon,
    );
  }
}
