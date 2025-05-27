//import 'package:coin_analyzer/app/core/internal/ui.dart';
import 'package:PDF_Flow/style/color.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    //required this.onChanged,
    required this.text,
    required this.width,
    required this.height,
    this.updateText = false,
    super.key,
    this.padding,
    this.suffix,
    this.prefix,
    this.focusNode,
    this.autoFocus = false,
  });

  //final Function(String) onChanged;
  final String text;
  final double width;
  final double height;
  final EdgeInsets? padding;
  final Widget? suffix;
  final Widget? prefix;
  final bool updateText;
  final FocusNode? focusNode;
  final bool autoFocus;

  @override
  State<SearchField> createState() => SearchFieldState();
}

class SearchFieldState extends State<SearchField> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.text);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.updateText) {
      controller.text = widget.text;
    }
    return Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding ?? EdgeInsets.all(12.r),
      decoration: ShapeDecoration(
        color: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Center(
        child: TextField(
          autofocus: widget.autoFocus,
          focusNode: widget.focusNode,
          textAlignVertical: TextAlignVertical.center,
          controller: controller,
          cursorColor: ColorStyles.Red,
          //onChanged: widget.onChanged,
          //style: context.s16w510.copyWith(color: Colors.black),
          decoration: InputDecoration(
            isCollapsed: true,
            border: InputBorder.none,
            hintText: 'Search',
            // hintStyle: context.s16w510.copyWith(
            //   color: Colors.black.withAlpha(70),
            // ),
            suffixIcon: widget.suffix,
            prefixIcon:
                widget.prefix != null
                    ? Padding(
                      padding: EdgeInsets.only(right: 6.w),
                      child: widget.prefix,
                    )
                    : null,
            prefixIconConstraints: BoxConstraints.tight(Size(20.w, 21.h)),
          ),
        ),
      ),
    );
  }
}
