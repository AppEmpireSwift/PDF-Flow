import 'package:PDF_Flow/app/ui/root/widgets/menu_item.dart';
import 'package:flutter/material.dart';

class FileOptionsMenu extends StatelessWidget {
  const FileOptionsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // по высоте занимает только необходимое место
      children: [
        MenuItem(icon: Icons.edit_outlined,
          label: 'Rename',
          onTap: () {}), // Кнопки меню

        const Divider(height: 1), // Разделитель
        MenuItem(icon: Icons.delete_outline,
          label: 'Delete',
          isDestructive: true,
          onTap: () {}), // Кнопка "Delete"
      ],
    );
  }
}
