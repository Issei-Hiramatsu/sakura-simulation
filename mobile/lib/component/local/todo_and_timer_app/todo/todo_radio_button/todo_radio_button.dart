import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/single/button/custom_radio_button/custom_radio_button.dart';
import '../../../../shared/token/color/color.dart';

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
        padding: const EdgeInsets.all(8.0),
        child: CustomRadioButton(
          size: 26.sp,
          isSelected: isSelected,
          borderColor: gray,
          selectedFillColor: gray,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
