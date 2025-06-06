import 'package:PDF_Flow/app/ui/files/password_page.dart';
import 'package:PDF_Flow/app/ui/files/widgets/blur_context_menu.dart';
import 'package:PDF_Flow/app/ui/root/widgets/context_menu.dart';
import 'package:PDF_Flow/app/ui/files/widgets/file_options_menu.dart';
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

import 'package:PDF_Flow/app/ui/files/widgets/file_item_tile.dart';

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
          SizedBox(height: 24.h),
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

          SizedBox(height: 24.h),

          Container(
            child: Expanded(
              child: ListView(
                children: [
                  FileItemTile(
                    // iconPath: 'assets/icons/pdf_icon.png',
                    fileName: 'PDF_File_3456789_234.pdf',
                    date: '2025-02-10 04:23 PM',
                    onTapDown: (TapDownDetails details) {
                      
                      final position = details.globalPosition;
                      showContextMenu(
                        context,
                        position,
                        onShare: () => print('Share tapped'),
                        onRename: () => print('Rename tapped'),
                        onPassword: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        PasswordPage(), // Ваша целевая страница
                              ),
                            ),
                        onDelete: () => print('Delete tapped'),
                      );
                    },
                    onMorePressed: () {
                      // Покажи bottom sheet или popup menu
                    },
                  ),
                  // и другие элементы
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
