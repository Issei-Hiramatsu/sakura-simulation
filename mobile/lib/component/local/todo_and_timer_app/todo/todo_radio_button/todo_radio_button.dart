import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/single/custom_radio_button/custom_radio_button.dart';
import '../../../../shared/token/color/color.dart';

class TodoRadioButton extends StatelessWidget {
  const TodoRadioButton({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return CustomRadioButton(
      size: 20.sp,
      isSelected: isSelected,
      borderColor: gray,
      selectedFillColor: gray,
      onPressed: () {},
      icon: const Icon(Icons.check),
    );
  }
}
