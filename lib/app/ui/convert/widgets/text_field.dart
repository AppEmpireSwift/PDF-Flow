import 'package:PDF_Flow/app/ui/settings/widgets/search_field.dart';
import 'package:PDF_Flow/style/color.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TextInputWidget extends StatelessWidget {
  //final VoidCallback onTap;
  final String head;
  final String text;

  const TextInputWidget({
    super.key,
    //required this.onTap,
    required this.head,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(left: 15.w), child: Text(head)),
        SizedBox(height: 4.h),
        SizedBox(
          width: double.infinity,
          height: 56.h,
          child: TextField(
            style: TextStyle(fontSize: 16.sp),
            decoration: InputDecoration(
              hintText: text,
              filled: true,
              fillColor: ColorStyles.Surface,
              contentPadding: EdgeInsets.all(12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
