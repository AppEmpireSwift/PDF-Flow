import 'package:PDF_Flow/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConvertFormat {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  ConvertFormat({required this.label, required this.icon, required this.onTap});
}

class ConvertOptionSelector extends StatelessWidget {
  final String title;
  final List<ConvertFormat> formats;

  const ConvertOptionSelector({
    Key? key,
    required this.title,
    required this.formats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // 1. Занимаем всю доступную ширину
      // color: ColorStyles.Dark_pink,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.h),
          Wrap(
            //runAlignment: WrapAlignment.center,
            //mainAxisSize: MainAxisSize.max,
            //spacing: 4.w,
             //mainAxisAlignment: MainAxisAlignment.center,   
            children:     
                formats.map((format) {
                  return Padding(
                    padding: EdgeInsets.only(right: 8.w, top: 8.w),
                    child: GestureDetector(
                      onTap: format.onTap,
                      child: Container(
                        width: 60,
                        height: 80,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: ColorStyles.Light_gray,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(format.icon, color: Colors.grey[700]),
                            SizedBox(height: 6.h),
                            Text(
                              format.label,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
