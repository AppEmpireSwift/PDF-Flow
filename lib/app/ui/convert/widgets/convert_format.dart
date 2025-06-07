import 'package:PDF_Flow/style/color.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cupertino_popover/cupertino_popover.dart';
import 'dart:ui'; // Для блюра
import 'package:popover/popover.dart';


class ConvertFormat {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool isSelected; // Добавляем флаг выбранного состояния

  ConvertFormat({
    required this.label,
    required this.icon,
    required this.onTap,
    this.isSelected = false,
  });
}

class ConvertOptionSelector extends StatefulWidget {
  final String title;
  final List<ConvertFormat> initialFormats;
  final bool hasExtendedSettings; // Новый параметр

  const ConvertOptionSelector({
    Key? key,
    required this.title,
    required this.initialFormats,
    this.hasExtendedSettings = false, // По умолчанию false
  }) : super(key: key);

  @override
  _ConvertOptionSelectorState createState() => _ConvertOptionSelectorState();
}





enum PageOrientation { vertical, horizontal }

class _ConvertOptionSelectorState extends State<ConvertOptionSelector> {
  late List<ConvertFormat> formats;
  int? _selectedIndex;

  PageOrientation _selectedOrientation = PageOrientation.vertical;

  final GlobalKey _orientationKey = GlobalKey(); // Ключ для кнопки

  @override
  void initState() {
    super.initState();
    formats = widget.initialFormats;
  }

  void _selectFormat(int index) {
    setState(() {
      formats = formats
          .map((format) => ConvertFormat(
                label: format.label,
                icon: format.icon,
                onTap: format.onTap,
                isSelected: false,
              ))
          .toList();

      formats[index] = ConvertFormat(
        label: formats[index].label,
        icon: formats[index].icon,
        onTap: formats[index].onTap,
        isSelected: true,
      );

      _selectedIndex = widget.hasExtendedSettings ? index : null;
      formats[index].onTap();
    });
  }

  void _showOrientationPopover(BuildContext buttonContext) {
  showPopover(
    context: buttonContext,
    bodyBuilder: (context) => _buildOrientationPopoverContent(),
    direction: PopoverDirection.bottom,
    width: 180,
    height: 110,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black12,
    arrowHeight: 8,
    arrowWidth: 16,
    transitionDuration: const Duration(milliseconds: 150),
    shadow: [],
    radius: 12,
    barrierDismissible: true,
  );
}


  Widget _buildOrientationPopoverContent() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.85),
            borderRadius: BorderRadius.circular(16.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Column(
            children: [
              _buildOrientationItem('Vertical', PageOrientation.vertical),
              _buildOrientationItem('Horizontal', PageOrientation.horizontal),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrientationItem(String title, PageOrientation orientation) {
    final isSelected = _selectedOrientation == orientation;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedOrientation = orientation;
        });
        Navigator.of(context).pop();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontSize: 14.sp)),
            if (isSelected)
              Icon(Icons.check, size: 18.r, color: ColorStyles.Outline_red),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: ColorStyles.Surface,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 12.h),
          Wrap(
            children: formats.asMap().entries.map((entry) {
              final index = entry.key;
              final format = entry.value;
              return Padding(
                padding: EdgeInsets.only(right: 4.w, bottom: 4.h),
                child: GestureDetector(
                  onTap: () => _selectFormat(index),
                  child: Container(
                    width: 60,
                    height: 80,
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: format.isSelected
                          ? ColorStyles.Pink
                          : ColorStyles.Light_gray,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: format.isSelected
                            ? ColorStyles.Outline_red
                            : Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          format.icon,
                          color: format.isSelected
                              ? ColorStyles.Outline_red
                              : ColorStyles.Grey,
                          size: 24,
                        ),
                        SizedBox(height: 6),
                        Text(
                          format.label,
                          style: TextStyle(
                            fontSize: 11,
                            color: format.isSelected
                                ? ColorStyles.Outline_red
                                : ColorStyles.Grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          if (widget.hasExtendedSettings && _selectedIndex != null) ...[
            SizedBox(height: 16.h),
            _buildExtendedSettings(),
          ],
        ],
      ),
    );
  }


Widget _buildExtendedSettings() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('PDF Settings',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
      SizedBox(height: 12.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Page orientation', style: TextStyle(fontSize: 14.sp)),

          /// ✅ Оборачиваем кнопку в Builder
          Builder(
            builder: (buttonContext) => GestureDetector(
              onTap: () => _showOrientationPopover(buttonContext),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                child: Row(
                  children: [
                    Text(
                      _selectedOrientation == PageOrientation.vertical
                          ? 'Vertical'
                          : 'Horizontal',
                      style: TextStyle(color: ColorStyles.Grey),
                    ),
                    SizedBox(width: 4.w),
                    Icon(Icons.arrow_drop_down,
                        size: 20.r, color: ColorStyles.Grey),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Divider(height: 1, color: ColorStyles.Light_gray),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Page size', style: TextStyle(fontSize: 14.sp)),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              child: Row(
                children: [
                  Text('A4', style: TextStyle(color: ColorStyles.Grey)),
                  SizedBox(width: 4.w),
                  Icon(Icons.arrow_drop_down,
                      size: 20.r, color: ColorStyles.Grey),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

  // Widget _buildExtendedSettings() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text('PDF Settings',
  //           style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
  //       SizedBox(height: 12.h),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text('Page orientation', style: TextStyle(fontSize: 14.sp)),
  //           GestureDetector(
  //             //key: _orientationKey,
  //             onTap: _showOrientationPopover,
  //             //borderRadius: BorderRadius.circular(8.r),
  //             child: Container(
  //               padding:
  //                   EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
  //               child: Row(
  //                 children: [
  //                   Text(
  //                     _selectedOrientation == PageOrientation.vertical
  //                         ? 'Vertical'
  //                         : 'Horizontal',
  //                     style: TextStyle(color: ColorStyles.Grey),
  //                   ),
  //                   SizedBox(width: 4.w),
  //                   Icon(Icons.arrow_drop_down,
  //                       size: 20.r, color: ColorStyles.Grey),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //       Padding(
  //         padding: EdgeInsets.symmetric(vertical: 12.h),
  //         child: Divider(height: 1, color: ColorStyles.Light_gray),
  //       ),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text('Page size', style: TextStyle(fontSize: 14.sp)),
  //           InkWell(
  //             onTap: () {},
  //             borderRadius: BorderRadius.circular(8.r),
  //             child: Container(
  //               padding:
  //                   EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
  //               child: Row(
  //                 children: [
  //                   Text('A4', style: TextStyle(color: ColorStyles.Grey)),
  //                   SizedBox(width: 4.w),
  //                   Icon(Icons.arrow_drop_down,
  //                       size: 20.r, color: ColorStyles.Grey),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }
}

// import 'package:flutter/material.dart';
// import 'package:popover/popover.dart';
// import 'dart:ui';

// enum PageOrientation { vertical, horizontal }

// class ConvertOptionSelector extends StatefulWidget {
//   final String title;

//   const ConvertOptionSelector({
//     Key? key,
//     required this.title,
//   }) : super(key: key);

//   @override
//   State<ConvertOptionSelector> createState() => _ConvertOptionSelectorState();
// }

// class _ConvertOptionSelectorState extends State<ConvertOptionSelector> {
//   final GlobalKey _orientationKey = GlobalKey();
//   PageOrientation _selectedOrientation = PageOrientation.vertical;

//   void _showOrientationPopover() {
//     final RenderBox renderBox =
//         _orientationKey.currentContext!.findRenderObject() as RenderBox;
//     final Offset offset = renderBox.localToGlobal(Offset.zero);
//     final Size size = renderBox.size;

//     final Rect targetRect = Rect.fromLTWH(
//       offset.dx,
//       offset.dy,
//       size.width,
//       size.height,
//     );

//     showPopover(
//       context: context,
//       bodyBuilder: (context) => _buildOrientationPopoverContent(),
//       direction: PopoverDirection.bottom,
//       width: 200,
//       height: 110,
//       arrowHeight: 8,
//       arrowWidth: 16,
//       backgroundColor: Colors.transparent,
//       barrierColor: Colors.black12,
//       radius: 12,
//       shadow: [],
//       //position: targetRect,
//     );
//   }

//   Widget _buildOrientationPopoverContent() {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(16),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.85),
//             borderRadius: BorderRadius.circular(16),
//           ),
//           padding: const EdgeInsets.symmetric(vertical: 12),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               _buildOrientationItem('Vertical', PageOrientation.vertical),
//               _buildOrientationItem('Horizontal', PageOrientation.horizontal),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildOrientationItem(String title, PageOrientation orientation) {
//     final isSelected = _selectedOrientation == orientation;

//     return InkWell(
//       onTap: () {
//         setState(() {
//           _selectedOrientation = orientation;
//         });
//         Navigator.of(context).pop();
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(title),
//             if (isSelected)
//               const Icon(Icons.check, size: 18, color: Colors.red),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(widget.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text('Page orientation:'),
//               GestureDetector(
//                 key: _orientationKey,
//                 onTap: _showOrientationPopover,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: Colors.grey),
//                   ),
//                   child: Row(
//                     children: [
//                       Text(
//                         _selectedOrientation == PageOrientation.vertical ? 'Vertical' : 'Horizontal',
//                       ),
//                       const SizedBox(width: 4),
//                       const Icon(Icons.arrow_drop_down),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
