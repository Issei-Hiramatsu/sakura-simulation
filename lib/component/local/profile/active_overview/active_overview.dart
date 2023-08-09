import 'package:flutter/material.dart';

import 'hooks/overview_data.dart';

class ActiveOverView extends StatelessWidget {
  const ActiveOverView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: GridView.count(
        crossAxisCount: 7,
        children: List.generate(data.length, (index) {
          int? contributionCount = data[index];
          if (contributionCount == null) {
            return Container(
              width: 12,
              height: 12,
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            );
          }
          return Container(
            width: 12,
            height: 12,
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Color.lerp(
                Colors.white,
                Colors.green[800]!,
                contributionCount / 10,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          );
        }),
      ),
    );
  }
}
