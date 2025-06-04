import 'package:flutter/material.dart';

class FileItem extends StatefulWidget {
  final String fileName;
  
  const FileItem({Key? key, required this.fileName}) : super(key: key);

  @override
  _FileItemState createState() => _FileItemState();
}

class _FileItemState extends State<FileItem> {
  late String _currentFileName;
  bool _isEditing = false;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _currentFileName = widget.fileName;
    _textController.text = _currentFileName;
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _startEditing() {
    setState(() {
      _isEditing = true;
    });
  }

  void _saveEditing() {
    setState(() {
      _currentFileName = _textController.text;
      _isEditing = false;
    });
  }

  void _cancelEditing() {
    setState(() {
      _textController.text = _currentFileName;
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 7),
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.grey.shade300),
      //   borderRadius: BorderRadius.circular(8),
      // ),
      child: Row(
        children: [
          // Иконка файла
          Icon(Icons.insert_drive_file, size: 24, color: Colors.grey.shade700),
          const SizedBox(width: 4),
          
          // Название файла или поле редактирования
          Expanded(
            child: _isEditing
                ? TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                    ),
                    autofocus: true,
                    onSubmitted: (_) => _saveEditing(),
                  )
                : Text(
                    _currentFileName,
                    style: TextStyle(fontSize: 16),
                  ),
          ),
          
          // Иконка редактирования или кнопки сохранения/отмены
          if (!_isEditing)
            IconButton(
              icon: Icon(Icons.edit, size: 20),
              onPressed: _startEditing,
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
            )
          else
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.check, size: 20, color: Colors.green),
                  onPressed: _saveEditing,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
                IconButton(
                  icon: Icon(Icons.close, size: 20, color: Colors.red),
                  onPressed: _cancelEditing,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ],
            ),
        ],
      ),
    );
  }
}