import 'package:PDF_Flow/app/ui/files/password_page.dart';
import 'package:PDF_Flow/app/ui/root/home.page.dart';
import 'package:PDF_Flow/app/ui/root/widgets/context_menu.dart';
import 'package:PDF_Flow/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DeleteFilesPage extends StatelessWidget {
  const DeleteFilesPage({super.key});




  void _showRenameDialog(BuildContext context) {
       String fileName = "Documents";

    TextEditingController _controller = TextEditingController(text: fileName);

    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("Rename"),
          content: Column(
            children: [
              SizedBox(height: 8),
              Text("Enter a name for the file"),
              SizedBox(height: 8),
              CupertinoTextField(
                controller: _controller,
                placeholder: 'File name',
                clearButtonMode: OverlayVisibilityMode.editing,
              ),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            CupertinoDialogAction(
              child: Text("Save"),
              isDefaultAction: true,
              onPressed: () {
                  fileName = _controller.text.trim();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }





  
  void _showCupertinoDeleteDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Column(
            children: [
              Icon(CupertinoIcons.delete_solid, size: 40, color: CupertinoColors.systemRed),
              SizedBox(height: 12),
              Text('File deletion'),
            ],
          ),
          content: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text('The file will not be saved'),
          ),
          actions: [
            CupertinoDialogAction(
              child: Text('Cancel', style: TextStyle(color: Colors.black),),
              onPressed: () => Navigator.of(context).pop(),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop();
                // Add deletion logic here
              },
            ),
          ],
        );
      },
    );
  }

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
                onRename: () => _showRenameDialog(context),
                onPassword:
                    () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PasswordPage()),
                    ),
                onDelete: () =>_showCupertinoDeleteDialog(context),
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
        height: 72, // Фиксированная высота разделителя
        child: VerticalDivider(width: 1, thickness: 1, color: Colors.grey),
      ),

                            SizedBox(width: 16),


// Container(
//       height: 48,
//       width: 1,
//       color: Colors.grey[300], // Цвет линии
//     ),
                      TextButton(
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
