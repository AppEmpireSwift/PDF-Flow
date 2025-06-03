import 'package:PDF_Flow/style/color.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectableFileWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String head;
  final String text;
  


  const SelectableFileWidget({super.key, required this.onTap, required this.head, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
              // width: 361.w, // ширина 200 пикселей
              // height: 349.h, // высота 100 пикселей
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    head,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 9.h),
                  CircleAvatar(
                    radius: 28.r,
                    backgroundColor: const Color(0xFFFFE5E5),
                    child: Icon(
                      Icons.file_present,
                      color: ColorStyles.Red,
                      size: 32.r,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  
                  // SizedBox(height: 16.h),
                  // GridView.count(
                  //   crossAxisCount: 3,
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   mainAxisSpacing: 9.h,
                  //   crossAxisSpacing: 9.w,
                  //   childAspectRatio: 104 / 80, // РАЗМЕРЫ КНОПОК
                  //   children: const [
                  //     _GridItem(icon: Icons.camera_alt, label: 'Camera'),
                  //     _GridItem(icon: Icons.photo, label: 'Gallery'),
                  //     _GridItem(icon: Icons.insert_drive_file, label: 'Files'),
                  //     _GridItem(icon: Icons.text_fields, label: 'Text'),
                  //     _GridItem(icon: Icons.link, label: 'Link'),
                  //     _GridItem(icon: Icons.input, label: 'Import'),
                  //   ],
                  // ),
                ],
              ),
            );
  }
}
