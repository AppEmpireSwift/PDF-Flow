import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../style/style.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const SettingsTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding( // Добавим отступ между плитками
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Material(
        color: ColorStyles.white,
        borderRadius: BorderRadius.circular(8).r,
        child: InkWell(
          borderRadius: BorderRadius.circular(8).r,
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 16.h),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyles.bodyRegular.copyWith(
                      color: ColorStyles.On_surface,
                    ),
                  ),
                ),
                Icon(
                  CupertinoIcons.chevron_right,
                  color: ColorStyles.Outline,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
