// import 'package:PDF_Flow/app/ui/settings/widgets/search_field.dart';
// import 'package:PDF_Flow/style/color.style.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// class TextInputWidget extends StatelessWidget {
//   //final VoidCallback onTap;
//   final String head;
//   final String text;
//   final bool expands;
//   const TextInputWidget({
//     super.key,
//     //required this.onTap,
//     required this.head,
//     required this.text,
//     this.expands = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(padding: EdgeInsets.only(left: 15.w), child: Text(head)),
//         SizedBox(height: 4.h),
//         SizedBox(
//           width: double.infinity,
//           height: 56.h,
//           child: IntrinsicHeight(
//             child: TextField(
//               maxLines:
//                   expands ? null : 1, // null = неограниченное кол-во строк
//               minLines: expands ? 1 : null, // Минимум 1 строка
//               style: TextStyle(fontSize: 16.sp),
//               decoration: InputDecoration(
//                 hintText: text,
//                 filled: true,
//                 fillColor: ColorStyles.Surface,
//                 contentPadding: EdgeInsets.all(12),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide.none,
//                 ),
//                 isDense: true,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:PDF_Flow/style/color.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInputWidget extends StatefulWidget {
  final String head;
  final String text;
  final bool expands;

  const TextInputWidget({
    super.key,
    required this.head,
    required this.text,
    this.expands = false,
  });

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  double _fieldHeight = 56.h;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w), 
          child: Text(widget.head),
        ),
        SizedBox(height: 4.h),
        SizedBox(
          height: _fieldHeight,
          child: TextField(
            maxLines: widget.expands ? null : 1,
            minLines: 1,
            style: TextStyle(fontSize: 16.sp),
            decoration: InputDecoration(
              hintText: widget.text,
              filled: true,
              fillColor: ColorStyles.Surface,
              contentPadding: EdgeInsets.all(12.w),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (text) {
              if (!widget.expands) return;
              
              final textPainter = TextPainter(
                text: TextSpan(
                  text: text,
                  style: TextStyle(fontSize: 16.sp),
                ),
                maxLines: null,
                textDirection: TextDirection.ltr,
              )..layout(maxWidth: MediaQuery.of(context).size.width - 24.w - 24.w);

              setState(() {
                _fieldHeight = (textPainter.size.height + 24.h).clamp(56.h, 200.h);
              });
            },
          ),
        ),
      ],
    );
  }
}
