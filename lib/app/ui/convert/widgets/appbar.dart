import 'package:PDF_Flow/style/color.style.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final Color backgroundColor;
  

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onBack,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
  leading: IconButton(
  icon: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Icon(Icons.arrow_back_ios_new, size: 17, color: ColorStyles.Red), 
      const Text('Back', style: TextStyle(fontSize: 16, color: ColorStyles.Red)), 
    ],
  ),
  padding: EdgeInsets.zero, // Убрать внутренние отступы
  constraints: const BoxConstraints(), // Убрать ограничения по умолчанию
  onPressed: onBack ?? () => Navigator.of(context).pop(),
),
      title: Text(title),
      centerTitle: true,
      //elevation: 100,
      foregroundColor: Colors.black, // Цвет текста и иконки
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}