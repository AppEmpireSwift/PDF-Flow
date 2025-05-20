import 'dart:ui';

import 'package:flutter/material.dart';

class ColorStyles {
  static const indigoWithOpacity = Color(0x265856D6);
  static const indigo = Color(0xFF5856D6);
  static const green = Color(0xFF34C759);
  static const greenWithOpacity = Color(0x3334C759);
  static const bgSecondary = Color(0xFFF2F2F7);
  static const primaryTxt = Color(0xFF131313);

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const pink = Color(0xFFFF2D55);
  static const pinkWithOpacity = Color(0x33FF2D55);
  static const orange = Color(0xFFFF9500);
  static const orangeWithOpacity = Color(0x33FF9500);
  static const cyan = Color(0xFF32ADE6);
  static const cyanWithOpacity = Color(0x3332ADE6);
  static const yellow = Color(0xFFFFCC00);
  static const yellowWithOpacity = Color(0x33FFCC00);

  static const yellowDark = Color(0xFFFFD60A);

  static const color1 = Color(0xFFE7F3FF);
  static const color2 = Color(0x99FFFFFF);
  static const labelsSecondaryDark = Color(0x99EBEBF5);
  static const color4 = Color(0x4DEBEBF5);
  static const color5 = Color(0x29EBEBF5);
  static const color6 = Color(0x993C3C43);
  static const labelsTertiary = Color(0x4D3C3C43);
  static const color8 = Color(0x2E3C3C43);
  static const fillsTertiary = Color(0x1F767680);

  static const color0 = Color(0xFFC7C7CC);

  static const gray2Dark = Color(0xFF636366);
}

class ThemeColors {
  static const splashBackground = ColorStyles.indigo;
  static const pageBackground = ColorStyles.bgSecondary;
  static const appBarBackground = ColorStyles.bgSecondary;
  static const appBarForeground = ColorStyles.primaryTxt;

  static const filledButton = ColorStyles.indigo;
  static const filledButtonDisalbed = ColorStyles.fillsTertiary;
  static const filledButtonForeground = ColorStyles.white;
  static const filledButtonText = ColorStyles.white;
  static const filledButtonDisableText = ColorStyles.labelsTertiary;
  static const filledButtonDisableForeground = ColorStyles.labelsTertiary;
  static const textFieldBackground = ColorStyles.white;
  static const textFieldInput = ColorStyles.indigo;

  static const iconColor = ColorStyles.indigo;
  static const actionIconColor = ColorStyles.indigo;
  static const deleteColor = ColorStyles.pink;
}
