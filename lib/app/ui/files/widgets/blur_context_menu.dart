// blur_popup_menu.dart
import 'dart:ui';
import 'package:flutter/material.dart';

class BlurPopupMenu {
  static void show(
    BuildContext context,
    Offset position, {
    required VoidCallback onShare,
    required VoidCallback onRename,
    required VoidCallback onPassword,
    required VoidCallback onDelete,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Transparent dismiss layer
          Positioned.fill(
            child: GestureDetector(
              onTap: () => entry.remove(),
              child: Container(color: Colors.transparent),
            ),
          ),

          // Menu
          Positioned(
            left: position.dx,
            top: position.dy,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  width: 200,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(220),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _BlurMenuItem(
                        icon: Icons.share,
                        label: 'Share',
                        onTap: () {
                          entry.remove();
                          onShare();
                        },
                      ),
                      _BlurMenuItem(
                        icon: Icons.edit,
                        label: 'Rename',
                        onTap: () {
                          entry.remove();
                          onRename();
                        },
                      ),
                      _BlurMenuItem(
                        icon: Icons.lock,
                        label: 'Add Password',
                        onTap: () {
                          entry.remove();
                          onPassword();
                        },
                      ),
                      const Divider(),
                      _BlurMenuItem(
                        icon: Icons.delete_outline,
                        label: 'Delete',
                        isDestructive: true,
                        onTap: () {
                          entry.remove();
                          onDelete();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    overlay.insert(entry);
  }
}

class _BlurMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDestructive;

  const _BlurMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDestructive ? Colors.red : Colors.black;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(width: 8),
            Text(label, style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }
}
