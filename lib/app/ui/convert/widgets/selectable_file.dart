// import 'package:PDF_Flow/style/color.style.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class SelectableFileWidget extends StatelessWidget {
//   final VoidCallback onTap;
//   final String head;
//   final String text;

//   const SelectableFileWidget({
//     super.key, 
//     required this.onTap, 
//     required this.head, 
//     required this.text
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//         padding: EdgeInsets.all(8.r),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12.r),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Align(alignment: Alignment.centerLeft, child: 
//             Text(
//               head,
//               textAlign: TextAlign.left,
//               style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
//             ),),
//             SizedBox(height: 9.h),
//             InkWell(
//               onTap: onTap, // Пустой обработчик для кликабельности
//               borderRadius: BorderRadius.circular(28.r), // Радиус совпадает с CircleAvatar
//               child: CircleAvatar(
//                 radius: 28.r,
//                 backgroundColor: const Color(0xFFFFE5E5),
//                 child: Icon(
//                   Icons.file_present,
//                   color: ColorStyles.Red,
//                   size: 32.r,
//                 ),
//               ),
//             ),
//             SizedBox(height: 12.h),
//             Text(
//               text,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 13.sp,
//               ),
//             ),
//             SizedBox(height: 4.h),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:PDF_Flow/style/color.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FileData {
  final String name;
  final String size;
  final String extension;
  final ImageProvider image;

  FileData({
    required this.name,
    required this.size,
    required this.extension,
    required this.image,
  });
}

class SelectableFileWidget extends StatefulWidget {
  final String head;
  final String text;
  final VoidCallback onAddFile;

  const SelectableFileWidget({
    super.key,
    required this.head,
    required this.text,
    required this.onAddFile,
  });

  @override
  State<SelectableFileWidget> createState() => _SelectableFileWidgetState();
}

class _SelectableFileWidgetState extends State<SelectableFileWidget> {
  final List<FileData> _files = [];

  void _addFile() {
    setState(() {
      _files.add(FileData(
        name: 'IMG_523${_files.length + 1}',
        size: '2.5 MB',
        extension: 'jpg',
        
        
        image: const AssetImage('assets/zagluska.jpg'),
      ));
    });
    widget.onAddFile();
  }

  void _removeFile(int index) {
    setState(() {
      _files.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: _files.isEmpty ? _buildEmptyState() : _buildFileList(),
    );
  }

  Widget _buildEmptyState() {
    return GestureDetector(
      onTap: _addFile,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.head,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 9.h),
          CircleAvatar(
            radius: 28.r,
            backgroundColor: const Color(0xFFFFE5E5),
            child: Icon(Icons.file_present, color: ColorStyles.Red, size: 32.r),
          ),
          SizedBox(height: 12.h),
          Text(
            widget.text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
          ),
          SizedBox(height: 4.h),
        ],
      ),
    );
  }

  Widget _buildFileList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.head,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.h),
        ..._files.asMap().entries.map((entry) {
          final index = entry.key;
          final file = entry.value;
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image(
                    image: file.image,
                    width: 48.r,
                    height: 48.r,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    '${file.name}\n${file.size} • ${file.extension}',
                    style: TextStyle(fontSize: 13.sp),
                  ),
                ),
                GestureDetector(
                  onTap: () => _removeFile(index),
                  child: const Icon(Icons.close, size: 20),
                ),
              ],
            ),
          );
        }),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: _addFile,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              color: ColorStyles.Red,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: const Center(
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
