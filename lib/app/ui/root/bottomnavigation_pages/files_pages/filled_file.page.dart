import 'package:PDF_Flow/style/color.style.dart';
import 'package:PDF_Flow/style/text.style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:PDF_Flow/app/app.dart';
import 'package:PDF_Flow/app/ui/premium/widgets/premium_banner.dart';
import 'package:PDF_Flow/app/ui/settings/settings.page.dart';
import 'package:PDF_Flow/app/ui/statistic/widgets/week_stats.dart';

import 'package:PDF_Flow/app/ui/root/widgets/file_item_tile.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

class FilledFilesPage extends StatelessWidget {
  const FilledFilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.Background, // светло-розовый фон
      appBar: AppBar(
        backgroundColor: ColorStyles.Surface,
        title: Row(
          children: [
            Text('Files', style: TextStyles.ForlargeTitleRegular),

            Spacer(),

            IconButton(
              icon: Icon(Icons.search, color: ColorStyles.Red),
              onPressed: () {},
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 16.w),
              Text('0 Files', style: TextStyle(fontSize: 14.sp)),
              Text('Sort by: ', style: TextStyle(fontSize: 14.sp)),
              Spacer(),
              Text(
                'Date',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.red),
              SizedBox(width: 16.w),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                FileItemTile(
                  // iconPath: 'assets/icons/pdf_icon.png',
                  fileName: 'PDF_File_3456789_234.pdf',
                  date: '2025-02-10 04:23 PM',
                  onMorePressed: () {
                    // Покажи bottom sheet или popup menu
                  },
                ),
                // и другие элементы
              ],
            ),
          ),
        ],
      ),

      // body: Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      //   child: Column(
      //     children: [
      //       // Row with "0 Files" and Sort
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text('0 Files', style: TextStyle(fontSize: 14.sp)),
      //           Row(
      //             children: [
      //               Text('Sort by: ', style: TextStyle(fontSize: 14.sp)),
      //               Text(
      //                 'Date',
      //                 style: TextStyle(
      //                   fontSize: 14.sp,
      //                   fontWeight: FontWeight.bold,
      //                   color: Colors.red,
      //                 ),
      //               ),
      //               Icon(Icons.keyboard_arrow_down, color: Colors.red),
      //             ],
      //           ),
      //         ],
      //       ),
      //       SizedBox(height: 40.h),

      //       // Center section (No files)
      //       Expanded(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             SizedBox(height: 8.h),
      //             Text(
      //               'No files',
      //               style: TextStyle(
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 18.sp,
      //                 color: Colors.black,
      //               ),
      //             ),
      //             SizedBox(height: 4.h),
      //             Text(
      //               "You don't have any converted files",
      //               style: TextStyle(fontSize: 14.sp, color: Colors.grey),
      //             ),
      //             SizedBox(height: 8.h),
      //             ElevatedButton(
      //               onPressed: () {
      //                 // Навигация на Convert или логика
      //               },
      //               style: ElevatedButton.styleFrom(
      //                 backgroundColor: ColorStyles.Primary,
      //                 padding: EdgeInsets.symmetric(
      //                   horizontal: 32.w,
      //                   vertical: 12.h,
      //                 ),
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(12.r),
      //                 ),
      //               ),
      //               child: Row(
      //                mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Text(
      //                     'Convert now',
      //                     style: TextStyle(
      //                       fontSize: 16.sp,
      //                       color: ColorStyles.On_Primary,
      //                     ),
      //                   ),
      //                   SizedBox(width: 8.w),
      //                   Icon(
      //                     CupertinoIcons.chevron_right,
      //                     size: 18.sp,
      //                     color: ColorStyles.On_Primary,
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
