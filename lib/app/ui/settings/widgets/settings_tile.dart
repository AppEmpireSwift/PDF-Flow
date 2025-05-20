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
    return ListTile(
      onTap: onTap,

      contentPadding: EdgeInsets.symmetric(horizontal: 16).r,

      title: Text(title),
      titleTextStyle: TextStyles.bodyRegular.copyWith(
        color: ColorStyles.primaryTxt,
      ),
      trailing: Icon(CupertinoIcons.chevron_right, color: ColorStyles.indigo),
    );
  }
}
