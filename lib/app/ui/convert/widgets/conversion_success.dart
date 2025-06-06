import 'package:PDF_Flow/app/ui/convert/widgets/file_item.dart';
import 'package:PDF_Flow/style/color.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConversionSuccess extends StatelessWidget {
  const ConversionSuccess({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
  //     padding: EdgeInsets.all(16.r),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(12.r),
  //       color: ColorStyles.Surface,
  //     ),
  //     child: Column(
  //       children: [
  //         const SizedBox(height: 20),
  //         const Icon(Icons.check_circle, size: 80, color: Colors.green),
  //         const Text("Conversion completed", style: TextStyle(fontSize: 18)),
  //         const SizedBox(height: 85),
  //         FileItem(fileName: 'JPG_File_354443_234.jpg'),
  //         const SizedBox(height: 85),
  //         ElevatedButton.icon(
  //           onPressed: () {},
  //           icon: Icon(Icons.share, size: 20.r),
  //           label: Text(
  //             'Share',
  //             style: TextStyle(fontSize: 16.sp, color: ColorStyles.Red),
  //           ),
  //           style: ElevatedButton.styleFrom(
  //             backgroundColor: ColorStyles.Pink,
  //             foregroundColor: ColorStyles.Red,
  //             minimumSize: Size.fromHeight(56.h),
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(12.r),
  //             ),
  //           ),
  //         ),
  //         const SizedBox(height: 12),
  //         ElevatedButton.icon(
  //           onPressed: () {},
  //           icon: Icon(Icons.remove_red_eye, size: 20.r),
  //           label: Text(
  //             'Preview',
  //             style: TextStyle(fontSize: 16.sp, color: ColorStyles.Outline_red),
  //           ),
  //           style: ElevatedButton.styleFrom(
  //              backgroundColor: ColorStyles.Surface,
  //              foregroundColor: ColorStyles.Red,
  //             side: BorderSide(
  //               color: ColorStyles.Outline_red, // цвет рамки
  //               width: 1, // толщина рамки
  //             ),
  //             minimumSize: Size.fromHeight(56.h),
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(12.r),
  //             ),
  //           ),
  //         ),
  //         const SizedBox(height: 12),
  //         ElevatedButton.icon(
  //           onPressed: () {},
  //           icon: Icon(Icons.picture_as_pdf, size: 20.r),
  //           label: Text('Save', style: TextStyle(fontSize: 16.sp)),
  //           style: ElevatedButton.styleFrom(
  //             backgroundColor: ColorStyles.Primary,
  //             foregroundColor: Colors.white,
  //             minimumSize: Size.fromHeight(56.h),
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(12.r),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
Widget build(BuildContext context) {
  return SafeArea(
    child: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: ColorStyles.Surface,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Icon(Icons.check_circle, size: 80, color: Colors.green),
            const Text("Conversion completed", style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            const SizedBox(height: 85),

            FileItem(fileName: 'JPG_File_354443_234.jpg'),
            const SizedBox(height: 85),

            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.share, size: 20.r),
              label: Text(
                'Share',
                style: TextStyle(fontSize: 16.sp, color: ColorStyles.Red),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorStyles.Pink,
                foregroundColor: ColorStyles.Red,
                minimumSize: Size.fromHeight(56.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.remove_red_eye, size: 20.r),
              label: Text(
                'Preview',
                style: TextStyle(fontSize: 16.sp, color: ColorStyles.Outline_red),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorStyles.Surface,
                foregroundColor: ColorStyles.Red,
                side: BorderSide(color: ColorStyles.Outline_red, width: 1),
                minimumSize: Size.fromHeight(56.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.picture_as_pdf, size: 20.r),
              label: Text('Save', style: TextStyle(fontSize: 16.sp)),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorStyles.Primary,
                foregroundColor: Colors.white,
                minimumSize: Size.fromHeight(56.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}
