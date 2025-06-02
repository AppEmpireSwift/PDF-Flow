import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: Row(
      //   mainAxisSize: MainAxisSize.min,
      //    children: [
      //   IconButton(
      //   icon: const Icon(Icons.arrow_back_ios_new, size: 10), // Иконка "<"
      //   padding: EdgeInsets.zero, // Убираем внутренние отступы
      //   onPressed: onBack ?? () => Navigator.of(context).pop(),
      //   ),
      //   Text('Back', style: TextStyle(fontSize: 14))
      //   ]
      // ),

      leading: IconButton(
    icon: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.arrow_back_ios_new, size: 16),
        const SizedBox(width: 4),
        const Text('Back', style: TextStyle(fontSize: 10)),
      ],
    ),
    onPressed: onBack ?? () => Navigator.of(context).pop(),
  ),
      title: Text(title),
      centerTitle: true,
      //elevation: 100,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black, // Цвет текста и иконки
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}