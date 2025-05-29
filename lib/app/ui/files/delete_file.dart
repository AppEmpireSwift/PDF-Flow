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
      body: Container(  color: ColorStyles.Background)
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('File deletion'),
          content: Text('The file will not be saved'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Закрыть диалог
              },
            ),
            TextButton(
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.red), // Красный цвет для кнопки удаления
              ),
              onPressed: () {
                // Действие при удалении
                print('Файл удален');
                Navigator.of(context).pop(); // Закрыть диалог
              },
            ),
          ],
        );
      },
    );
  }
}
