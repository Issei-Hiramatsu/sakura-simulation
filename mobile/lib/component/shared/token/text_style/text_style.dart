import 'package:flutter/material.dart';

FontWeight? fontWeight;
const regular = 'regular';
const medium = 'medium';
const bold = 'bold';

TextStyle header(Color color) => TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 26,
    );
TextStyle headerMedium(Color color) => TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 15,
    );

TextStyle bodyRegular(Color color) => TextStyle(
      color: color,
      fontWeight: FontWeight.w300,
      fontSize: 16,
    );
TextStyle bodySemiBold(Color color) => TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 15,
    );

TextStyle bodyBold(Color color) => TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    );

TextStyle callOutRegular(Color color) => TextStyle(
      color: color,
      fontWeight: FontWeight.w300,
      fontSize: 15,
    );
TextStyle callOutBold(Color color) => TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 15,
    );
TextStyle subHeadLineBold(Color color) => TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 13,
    );
TextStyle subHeadLineRegular(Color color) => TextStyle(
      color: color,
      fontWeight: FontWeight.w300,
      fontSize: 13,
    );

TextStyle bodySmall(FontWeight weight, Color color) => TextStyle(
      color: color,
      fontWeight: weight,
      fontSize: 12,
    );

TextStyle displayLarge(FontWeight weight, Color color) => TextStyle(
      color: color,
      fontWeight: weight,
      fontSize: 58,
    );
TextStyle displayMedium(FontWeight weight, Color color) => TextStyle(
      color: color,
      fontWeight: weight,
      fontSize: 46,
    );
TextStyle displaySmall(FontWeight weight, Color color) => TextStyle(
      color: color,
      fontWeight: weight,
      fontSize: 36,
    );

TextStyle headLineBold(Color color) => TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    );
TextStyle headLineRegular(Color color) => TextStyle(
      color: color,
      fontWeight: FontWeight.w300,
      fontSize: 15,
    );

TextStyle labelLarge(FontWeight weight, Color color) => TextStyle(
      color: color,
      fontWeight: weight,
      fontSize: 14,
    );
TextStyle labelMedium(FontWeight weight, Color color) => TextStyle(
      color: color,
      fontWeight: weight,
      fontSize: 12,
    );
TextStyle labelSmall(FontWeight weight, Color color) => TextStyle(
      color: color,
      fontWeight: weight,
      fontSize: 10,
    );

TextStyle title1Bold(Color color) => TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 26,
    );
TextStyle title1Regular(Color color) => TextStyle(
      color: color,
      fontWeight: FontWeight.w300,
      fontSize: 26,
    );
TextStyle title2Bold(Color color) => TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 20,
    );
TextStyle title2Regular(Color color) => TextStyle(
      color: color,
      fontWeight: FontWeight.w300,
      fontSize: 20,
    );
TextStyle title3Bold(Color color) => TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    );
TextStyle title3Regular(Color color) => TextStyle(
      color: color,
      fontWeight: FontWeight.w300,
      fontSize: 18,
    );
TextStyle titleMedium(FontWeight weight, Color color) => TextStyle(
      color: color,
      fontWeight: weight,
      fontSize: 16,
    );
TextStyle titleSmall(FontWeight weight, Color color) => TextStyle(
      color: color,
      fontWeight: weight,
      fontSize: 14,
    );

TextStyle caption1Bold(Color color) => TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 11,
    );
TextStyle caption1Regular(Color color) => TextStyle(
      color: color,
      fontWeight: FontWeight.w300,
      fontSize: 11,
    );
TextStyle caption2Bold(Color color) => TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 11,
    );
TextStyle caption2Regular(Color color) => TextStyle(
      color: color,
      fontWeight: FontWeight.w300,
      fontSize: 11,
    );
