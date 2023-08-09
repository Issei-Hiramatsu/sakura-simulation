import 'package:flutter/material.dart';
import 'package:sakura_simulation/importer.dart';

class IconImage extends StatelessWidget {
  const IconImage({super.key, required this.assets});

  final String assets;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assets,
      width: 256.sp,
      height: 256.sp,
    );
  }
}
