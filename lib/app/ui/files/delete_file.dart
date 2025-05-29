import 'package:PDF_Flow/app/ui/files/password_page.dart';
import 'package:PDF_Flow/app/ui/root/home.page.dart';
import 'package:PDF_Flow/app/ui/root/widgets/context_menu.dart';
import 'package:PDF_Flow/style/style.dart';
import 'package:flutter/material.dart';

class DeleteFilesPage extends StatelessWidget {
  const DeleteFilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorStyles.Background,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Действие при нажатии кнопки "Назад"
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomePage(), // Ваша целевая страница
              ),
            );
          },
        ),

        title: Text('PDF_File_3456789_234.pdf'),

        actions: [
          GestureDetector(
            onTapDown: (TapDownDetails details) {
              final position = details.globalPosition;
              showContextMenu(
                context,
                position,
                onShare: () => print('Share tapped'),
                onRename: () => print('Rename tapped'),
                onPassword:
                    () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PasswordPage()),
                    ),
                onDelete: () => _showDeleteDialog(context),
              );
            },
            child: Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: Container(color: ColorStyles.Background),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            color: ColorStyles.Background,
            // child: Padding(
            //   padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'File deletion',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('The file will not be saved'),
                SizedBox(height: 24),
                Divider(
                  height: 20, // Высота области разделителя (не толщина!)
                  thickness: 1, // Толщина линии
                  color: Colors.grey, // Цвет
                  // indent: 16,       // Отступ слева
                  // endIndent: 16,    // Отступ справа
                ),
                Container( child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: Text('Cancel'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      SizedBox(width: 16),
SizedBox(
        height: 24, // Фиксированная высота разделителя
        child: VerticalDivider(width: 1, thickness: 1, color: Colors.grey),
      ),                      TextButton(
                        child: Text(
                          'Delete',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          // Действие при удалении
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
            ),
              ],
            ),
            //),
          ),
        );
      },
    );
  }
}
