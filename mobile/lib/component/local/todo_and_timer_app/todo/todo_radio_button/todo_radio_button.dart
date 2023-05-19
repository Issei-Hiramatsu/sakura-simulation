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
    return CustomRadioButton(
      size: 20.sp,
      isSelected: isSelected,
      borderColor: gray,
      selectedFillColor: gray,
      onPressed: onPressed,
    );
  }
}
