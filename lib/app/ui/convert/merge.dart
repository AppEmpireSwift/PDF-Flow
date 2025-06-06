
import 'package:PDF_Flow/app/ui/convert/widgets/appbar.dart';
import 'package:PDF_Flow/app/ui/root/widgets/context_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:PDF_Flow/style/color.style.dart';
import 'package:PDF_Flow/style/text.style.dart';
import 'package:PDF_Flow/app/ui/files/widgets/file_item_tile.dart';
import 'package:PDF_Flow/app/ui/files/password_page.dart';
import 'package:PDF_Flow/app/ui/files/widgets/blur_context_menu.dart';

class MergePage extends StatefulWidget {
  const MergePage({super.key});

  @override
  State<MergePage> createState() => _MergePageState();
}

class _MergePageState extends State<MergePage> {
  List<bool> selectedFiles = [false, false];

  @override
  Widget build(BuildContext context) {
    final bool anySelected = selectedFiles.any((selected) => selected);

    return Scaffold(
      backgroundColor: ColorStyles.Background,
      appBar: CustomAppBar(title: 'Merge Files into PDF', backgroundColor: ColorStyles.Background),
      body: Column(
        children: [
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.builder(
              itemCount: selectedFiles.length,
              itemBuilder: (context, index) {
                return FileItemTile(
                  fileName: 'File_$index.pdf',
                  date: '2025-02-10 04:23 PM',
                  isSelectable: true,
                  isSelected: selectedFiles[index],
                  onSelectedChanged: (selected) {
                    setState(() {
                      selectedFiles[index] = selected!;
                    });
                  },
                  onTapDown: (details) {
                    showContextMenu(
                      context,
                      details.globalPosition,
                      onShare: () {},
                      onRename: () {},
                      onPassword: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => PasswordPage()),
                      ),
                      onDelete: () {},
                    );
                  },
                  onMorePressed: () {},
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.r),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: anySelected ? () {/* переход к следующему шагу */} : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: anySelected ? ColorStyles.Red : Colors.grey,
                foregroundColor: Colors.white,
                minimumSize: Size.fromHeight(56.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text('Next', style: TextStyle(fontSize: 16.sp)),
            ),
          ),
        ],
      ),
    );
  }
}
