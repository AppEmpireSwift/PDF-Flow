import 'package:PDF_Flow/app/ui/convert/widgets/appbar.dart';
import 'package:PDF_Flow/style/color.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ImportConvertPage extends StatelessWidget {
  const ImportConvertPage({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ColorStyles.Background,
      appBar: CustomAppBar(title: 'Import', backgroundColor: ColorStyles.Background),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.all(16.w),
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Первая строка - обычный текст
              Text(
                'Open the App',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 12.h),
              
              // Вторая строка - текст с иконкой
              Row(
                children: [
                  Text(
                    'Using the \'Share\' button',
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(Icons.input, size: 20.w, color: ColorStyles.Outline_red),
                ],
              ),
              SizedBox(height: 12.h),
              
              // Третья строка - обычный текст
              Text(
                'Select PDF Flow from the list',
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 4.h),
              
              // Четвертая строка - мелкий серый текст
              Text(
                'If it\'s not there, swipe to the right, click \'More\' and add it',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: ColorStyles.Grey,
                ),
              ),
              SizedBox(height: 20.h),
              
              // Место для изображения
               // PNG изображение
              Container(
                height: 150.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Image.asset(
                  'assets/Group 59.png',
                  fit: BoxFit.contain,
                ),
              ),

            //  SvgPicture.asset(
            //     'assets/Group 59.svg', // Путь к вашему SVG файлу
            //     height: 150.h,
            //     width: double.infinity,
            //     fit: BoxFit.contain,
            //   ),
            //   SizedBox(height: 20.h),
              
              // Пятая строка - обычный текст
              Text(
                'The file will open in PDF Flow',
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 4.h),
              
              // Шестая строка - мелкий серый текст
              Text(
                'And you can select the format to be converted',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: ColorStyles.Grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}