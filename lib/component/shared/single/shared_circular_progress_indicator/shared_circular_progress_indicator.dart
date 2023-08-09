import 'package:flutter/material.dart';
import '/component/shared/token/color/color.dart';

class SharedCircularProgressIndicator extends StatelessWidget {
  const SharedCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: primary,
      ),
    );
  }
}
