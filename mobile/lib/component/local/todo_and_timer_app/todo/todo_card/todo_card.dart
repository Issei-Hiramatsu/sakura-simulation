import 'package:flutter/material.dart';
import 'package:sakura_simulation/component/shared/token/text_style/text_style.dart';

import '../../../../shared/single/custom_radio_button/custom_radio_button.dart';
import '../../../../shared/token/color/color.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.text, required this.isSelected});

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: backgroundLightBlack,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          leading: CustomRadioButton(
            size: 26,
            isSelected: false,
            borderColor: gray,
            selectedFillColor: gray,
            onPressed: () {},
            icon: const Icon(Icons.check),
          ),
          //TODO: お気に入りボタン
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.star_outline,
              color: gray,
              size: 26,
            ),
          ),
          title: Text(
            text,
            style: isSelected
                ? title3Regular(white)
                : title3RegularLineThrough(gray),
          ),
        ),
      ),
    );
  }
}
