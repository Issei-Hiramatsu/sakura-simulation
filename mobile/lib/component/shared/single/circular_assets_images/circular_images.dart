import 'package:flutter/material.dart';

class CircularAssetsImages extends StatelessWidget {
  const CircularAssetsImages({
    super.key,
    required this.size,
    required this.assetsImage,
  });

  final double size;
  final String assetsImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(assetsImage),
        ),
      ),
    );
  }
}
