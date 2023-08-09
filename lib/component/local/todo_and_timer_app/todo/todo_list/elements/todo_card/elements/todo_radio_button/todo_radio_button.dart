import 'package:flutter/material.dart';
import 'package:sakura_simulation/importer.dart';

import '../../../../../../../../shared/single/button/custom_radio_button/custom_radio_button.dart';

class TodoRadioButton extends StatelessWidget {
  const TodoRadioButton(
      {super.key, required this.isSelected, required this.onPressed});

  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            CustomRadioButton(
              size: 26.sp,
              isSelected: isSelected,
              borderColor: gray,
              selectedFillColor: gray,
              onPressed: onPressed,
            ),
            isSelected
                ? const Icon(Icons.check, color: black)
                : Icon(Icons.check, color: backgroundLightBlack),
          ],
        ),
      ),
    );
  }
}
