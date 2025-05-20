import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'style.dart';

appThemeBuilder(BuildContext context) => ThemeData(
  textTheme: Typography.blackCupertino.apply(bodyColor: ColorStyles.black),
  colorScheme: ColorScheme.fromSeed(
    seedColor: ColorStyles.indigo,
    brightness: Brightness.light,
  ),
  iconTheme: const IconThemeData(color: ThemeColors.iconColor),
  scaffoldBackgroundColor: ThemeColors.pageBackground,
  appBarTheme: AppBarTheme(
    actionsPadding: EdgeInsets.symmetric(horizontal: 16).r,
    centerTitle: true,
    backgroundColor: ThemeColors.appBarBackground,
    foregroundColor: ThemeColors.appBarForeground,
    titleTextStyle: ThemeTextStyles.appBarTitle,
    iconTheme: const IconThemeData(color: ThemeColors.iconColor),
    actionsIconTheme: const IconThemeData(color: ThemeColors.actionIconColor),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.disabled)) {
          return ThemeColors.filledButtonDisalbed;
        }
        return ThemeColors.filledButton;
      }),
      textStyle: WidgetStateProperty.resolveWith<TextStyle>((state) {
        if (state.contains(WidgetState.disabled)) {
          return ThemeTextStyles.filledButttonDisabledText;
        }
        return ThemeTextStyles.filledButttonText;
      }),
      foregroundColor: WidgetStateProperty.resolveWith<Color>((state) {
        if (state.contains(WidgetState.disabled)) {
          return ThemeColors.filledButtonDisableForeground;
        }
        return ThemeColors.filledButtonForeground;
      }),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.spMin)),
      ),
      minimumSize: WidgetStateProperty.all(Size(162.r, 56.spMin)),
      maximumSize: WidgetStateProperty.all(Size(375.r, 56.spMin)),
    ),
  ),
  // outlinedButtonTheme: OutlinedButtonThemeData(
  //   style: ButtonStyle(
  //     textStyle: WidgetStateProperty.resolveWith<TextStyle>((state) {
  //       if (state.contains(WidgetState.disabled)) {
  //         return ThemeTextStyles.outlinedButttonDisabledText;
  //       }
  //       return ThemeTextStyles.outlinedButtonText;
  //     }),
  //     foregroundColor: WidgetStateProperty.resolveWith<Color>((state) {
  //       if (state.contains(WidgetState.disabled)) {
  //         return ThemeColors.outlinedButtonDisableForeground;
  //       }
  //       return ThemeColors.outlinedButtonForeground;
  //     }),
  //     side: WidgetStateProperty.resolveWith<BorderSide>((state) {
  //       if (state.contains(WidgetState.disabled)) {
  //         return const BorderSide(color: ThemeColors.outlinedButtonDisalbed);
  //       } else {
  //         return const BorderSide(color: ThemeColors.outlinedButton);
  //       }
  //     }),
  //     shape: WidgetStateProperty.all(
  //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(12).r),
  //     ),
  //     minimumSize: WidgetStateProperty.all(Size(50.r, 48.r)),
  //     maximumSize: WidgetStateProperty.all(Size(390.r, 54.r)),
  //   ),
  // ),
  cupertinoOverrideTheme: const CupertinoThemeData(
    barBackgroundColor: ThemeColors.pageBackground,
    scaffoldBackgroundColor: ThemeColors.pageBackground,
    primaryColor: ColorStyles.indigo,
  ),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    border: InputBorder.none,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    // contentPadding:
    //     const EdgeInsets.only(left: 15, right: 15, top: 12, bottom: 12).r,
  ),
);
