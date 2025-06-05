import 'package:PDF_Flow/style/color.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

class _ConvertOptionSelectorState extends State<ConvertOptionSelector> {
  late List<ConvertFormat> formats;
  int? _selectedIndex; // Текущий выбранный индекс

  @override
  void initState() {
    super.initState();
    formats = widget.initialFormats;
  }

  void _selectFormat(int index) {
    setState(() {
      // Сбрасываем все выделения
      formats =
          formats
              .map(
                (format) => ConvertFormat(
                  label: format.label,
                  icon: format.icon,
                  onTap: format.onTap,
                  isSelected: false,
                ),
              )
              .toList();

      // Устанавливаем выделение для выбранного элемента
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
          Text(
            widget.title,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.h),

          // Основные форматы
          Wrap(
            children:
                formats.asMap().entries.map((entry) {
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
                          color:
                              format.isSelected
                                  ? ColorStyles.Pink
                                  : ColorStyles.Light_gray,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color:
                                format.isSelected
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
                              color:
                                  format.isSelected
                                      ? ColorStyles.Outline_red
                                      : ColorStyles.Grey,
                              size: 24,
                            ),
                            SizedBox(height: 6),
                            Text(
                              format.label,
                              style: TextStyle(
                                fontSize: 11,
                                color:
                                    format.isSelected
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

          // Расширенные настройки (появляются при выборе и hasExtendedSettings=true)
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
        Text(
          'PDF Settings',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.h),

        // Page orientation
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Page orientation', style: TextStyle(fontSize: 14.sp)),
            InkWell(
              onTap: () {}, // Обработчик нажатия
              borderRadius: BorderRadius.circular(8.r),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: ColorStyles.Light_gray,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Text('Vertical', style: TextStyle(color: ColorStyles.Grey)),
                    SizedBox(width: 4.w),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 20.r,
                      color: ColorStyles.Grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        // Разделитель
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Divider(height: 1, color: ColorStyles.Light_gray),
        ),

        // Page size
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Page size', style: TextStyle(fontSize: 14.sp)),
            InkWell(
              onTap: () {}, // Обработчик нажатия
              borderRadius: BorderRadius.circular(8.r),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: ColorStyles.Light_gray,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Text('A4', style: TextStyle(color: ColorStyles.Grey)),
                    SizedBox(width: 4.w),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 20.r,
                      color: ColorStyles.Grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}