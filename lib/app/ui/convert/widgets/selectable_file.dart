import 'package:PDF_Flow/style/color.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectableFileWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String head;
  final String text;

  const SelectableFileWidget({
    super.key, 
    required this.onTap, 
    required this.head, 
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(alignment: Alignment.centerLeft, child: 
            Text(
              head,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),),
            SizedBox(height: 9.h),
            InkWell(
              onTap: onTap, // Пустой обработчик для кликабельности
              borderRadius: BorderRadius.circular(28.r), // Радиус совпадает с CircleAvatar
              child: CircleAvatar(
                radius: 28.r,
                backgroundColor: const Color(0xFFFFE5E5),
                child: Icon(
                  Icons.file_present,
                  color: ColorStyles.Red,
                  size: 32.r,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
              ),
            ),
            SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }
}