// import 'package:PDF_Flow/app/ui/settings/widgets/search_field.dart';
// import 'package:PDF_Flow/style/color.style.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// class TextFieldWidget extends StatelessWidget {
//   final VoidCallback onTap;
//   final String head;
//   final String text;

//     const TextFieldWidget({super.key, required this.onTap, required this.head, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [ (
//           autofocus: widget.autoFocus,
//           focusNode: widget.focusNode,
//           textAlignVertical: TextAlignVertical.center,
//           controller: controller,
//           cursorColor: ColorStyles.Red,
//           //onChanged: widget.onChanged,
//           //style: context.s16w510.copyWith(color: Colors.black),
//           decoration: InputDecoration(
//             isCollapsed: true,
//             border: InputBorder.none,
//             hintText: 'Search',
//             // hintStyle: context.s16w510.copyWith(
//             //   color: Colors.black.withAlpha(70),
//             // ),
//             prefixIcon:
//                 widget.prefix != null
//                     ? Padding(
//                       padding: EdgeInsets.only(right: 6.w),
//                       child: widget.prefix,
//                     )
//                     : null,
//             prefixIconConstraints: BoxConstraints.tight(Size(20.w, 21.h)),
//           ),
//     ),
//         ],
//         );
//   }
//   }