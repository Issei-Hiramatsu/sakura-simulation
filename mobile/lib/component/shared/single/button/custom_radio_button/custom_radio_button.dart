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
    return SizedBox(
      width: size,
      height: size,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: CircleBorder(
            side: BorderSide(color: borderColor, width: 2),
          ),
          side: BorderSide(color: borderColor, width: 2),
          backgroundColor: isSelected ? selectedFillColor : transparent,
        ),
        child: Container(),
      ),
    );
  }
}
