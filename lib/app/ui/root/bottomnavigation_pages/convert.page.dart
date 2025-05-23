import 'package:PDF_Flow/gen/assets.gen.dart';
import 'package:PDF_Flow/style/color.style.dart';
import 'package:PDF_Flow/style/text.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:PDF_Flow/app/app.dart';
import 'package:PDF_Flow/app/ui/premium/widgets/premium_banner.dart';
import 'package:PDF_Flow/app/ui/settings/settings.page.dart';
import 'package:PDF_Flow/app/ui/statistic/widgets/week_stats.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ConvertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red[50],
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // вертикальное центрирование
          children: [
            Container(
              color: Colors.white,
              width: 393.w,
              height: 80.h,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 16),
                  Text(
                    'File Converter',
                    style: TextStyles.ForlargeTitleRegular,
                  ),
                  Spacer(),

                  // actions: [
                  IconButton(
                    onPressed: () {},

                    icon: SvgPicture.asset(Assets.vectors.statistic),
                  ),
                  SizedBox(width: 16),

                  //   IconButton(
                  //     onPressed: () {
                  //       Navigator.of(
                  //         context,
                  //         rootNavigator: true,
                  //       ).push(SettingsPage.route());
                  //     },
                  //     style: ButtonStyle(
                  //       backgroundColor: WidgetStatePropertyAll(
                  //         ColorStyles.indigoWithOpacity,
                  //       ),
                  //     ),

                  //     icon: SvgPicture.asset(Assets.vectors.settings),
                  //   ),
                  // ],
                ],
              ),
            ),

            // Центральная карточка
            Container(
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
                    'Select File to Convert',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Choose from available sources',
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                  SizedBox(height: 16.h),
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 9.h,
                    crossAxisSpacing: 9.w,
                    childAspectRatio: 104 / 80, // РАЗМЕРЫ КНОПОК
                    children: const [
                      _GridItem(icon: Icons.camera_alt, label: 'Camera'),
                      _GridItem(icon: Icons.photo, label: 'Gallery'),
                      _GridItem(icon: Icons.insert_drive_file, label: 'Files'),
                      _GridItem(icon: Icons.text_fields, label: 'Text'),
                      _GridItem(icon: Icons.link, label: 'Link'),
                      _GridItem(icon: Icons.input, label: 'Import'),
                    ],
                  ),
                ],
              ),
            ),

            // SizedBox(height: 3.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 8.w,
              ), // отступы слева и справа
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.picture_as_pdf, size: 20.r),
                label: Text(
                  'Merge Files into PDF',
                  style: TextStyle(fontSize: 16.sp),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorStyles.Primary,
                  foregroundColor: Colors.white,
                  minimumSize: Size.fromHeight(40.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 16), // отступ слева
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: ColorStyles.Outline_red,
                      size: 20.r,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Recent Conversions',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10),
            Icon(
              Icons.insert_drive_file,
              color: ColorStyles.Dark_pink,
              size: 50,
            ),
            Text(
              'This will be your recent file conversions',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class _GridItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _GridItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 104.w, // адаптивная ширина
      height: 80.h, // адаптивная высота
      child: Material(
        color: const Color(0xFFFFEBEB),
        borderRadius: BorderRadius.circular(12.r),
        child: InkWell(
          onTap: () {}, // обработчик нажатия
          borderRadius: BorderRadius.circular(12.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: ColorStyles.Outline_red, size: 24.r),
              SizedBox(height: 4.h),
              Text(
                label,
                style: TextStyle(
                  color: ColorStyles.Outline_red,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

