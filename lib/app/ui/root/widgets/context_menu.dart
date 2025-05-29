import 'package:flutter/material.dart';


/// Показывает всплывающее контекстное меню в заданной позиции
void showContextMenu(BuildContext context, Offset tapPosition, {
  required VoidCallback onShare,
  required VoidCallback onRename,
  required VoidCallback onPassword,
  required VoidCallback onDelete,
}) {
  final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
  final screenSize = overlay.size;

  showMenu<void>(
    context: context,
    position: RelativeRect.fromRect(
      Rect.fromPoints(tapPosition, tapPosition),
      Offset.zero & screenSize,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  color: Colors.white.withOpacity(0.7), // ← Вот здесь прозрачность
    items: [
      ContextMenuItem(icon: Icons.share, label: 'Share', onTap: onShare),
      ContextMenuItem(icon: Icons.edit, label: 'Rename', onTap: onRename),
      ContextMenuItem(icon: Icons.lock, label: 'Add Password', onTap: onPassword),
      const PopupMenuDivider(),
      ContextMenuItem(
        icon: Icons.delete_outline,
        label: 'Delete',
       //isDestructive: true,
        onTap: onDelete,
      ),
    ],
  );
}

PopupMenuItem ContextMenuItem({
  required IconData icon,
  required String label,
  required VoidCallback onTap,
  bool isDestructive = false,
}) {
  final color = isDestructive ? Colors.red : Colors.black;
  return PopupMenuItem(
    onTap: onTap,
    child: Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 8),
        Text(label, style: TextStyle(color: color)),
      ],
    ),
  );
}
