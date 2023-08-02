import 'package:flutter/material.dart';
import 'package:sakura_simulation/importer.dart';

class TimerSettingCard extends StatelessWidget {
  const TimerSettingCard({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: backgroundLightBlack,
      child: Center(
        child: ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.all(10),
          leading: Text(
            text,
            style: bodyRegular(white),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chevron_right,
                color: gray,
              )),
        ),
      ),
    );
  }
}
