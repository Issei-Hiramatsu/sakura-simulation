import 'package:flutter/material.dart';

class CircleElevatedButton extends StatelessWidget {
  const CircleElevatedButton({
    super.key,
    required this.size,
    required this.text,
    required this.textStyle,
  });
  final double size;
  final String text;
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
        ),
        onPressed: () {},
        child: FittedBox(
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
