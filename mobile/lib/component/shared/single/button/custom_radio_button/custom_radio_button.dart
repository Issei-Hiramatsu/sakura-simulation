import 'package:flutter/material.dart';
import 'package:sakura_simulation/component/shared/token/color/color.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.size,
    required this.borderColor,
    required this.onPressed,
    required this.isSelected,
    required this.selectedFillColor,
  });

  final double size;
  final Color borderColor;
  final Color selectedFillColor;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: ShapeDecoration(
        shape: CircleBorder(
          side: BorderSide(color: borderColor, width: 2),
        ),
        color: isSelected ? selectedFillColor : transparent,
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        child: Container(),
      ),
    );
  }
}
