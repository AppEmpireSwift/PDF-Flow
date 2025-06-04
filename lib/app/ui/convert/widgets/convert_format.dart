import 'package:PDF_Flow/style/style.dart';
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
  // Изменяем на StatefulWidget
  final String title;
  final List<ConvertFormat> initialFormats;

  const ConvertOptionSelector({
    Key? key,
    required this.title,
    required this.initialFormats,
  }) : super(key: key);

  @override
  _ConvertOptionSelectorState createState() => _ConvertOptionSelectorState();
}

class _ConvertOptionSelectorState extends State<ConvertOptionSelector> {
  late List<ConvertFormat> formats;

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

      // Вызываем оригинальный onTap
      formats[index].onTap();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft, // Первый элемент у левого края
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 12.h),
          Wrap(
            children:
                formats.asMap().entries.map((entry) {
                  final index = entry.key;
                  final format = entry.value;

                  return Padding(
                    padding: EdgeInsets.only(right: 8.w, top: 8.w),
                    child: GestureDetector(
                      onTap: () => _selectFormat(index),
                      child: Container(
                        width: 60,
                        height: 80,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color:
                              format.isSelected
                                  ? ColorStyles
                                      .Pink // Цвет фона для выбранного
                                  : ColorStyles
                                      .Light_gray, // Цвет фона по умолчанию
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color:
                                format.isSelected
                                    ? ColorStyles
                                        .Outline_red // Цвет обводки для выбранного
                                    : Colors
                                        .transparent, // Нет обводки по умолчанию
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              format.icon,
                              color:
                                  format.isSelected
                                      ? ColorStyles
                                          .Outline_red // Цвет иконки для выбранного
                                      : ColorStyles
                                          .Grey, // Цвет иконки по умолчанию
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              format.label,
                              style: TextStyle(
                                fontSize: 12,
                                color:
                                    format.isSelected
                                        ? ColorStyles
                                            .Outline_red // Цвет текста для выбранного
                                        : ColorStyles
                                            .Grey, // Цвет текста по умолчанию
                              ),
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
