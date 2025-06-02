import 'dart:io';

import 'package:flutter/material.dart';

class FilePreviewList extends StatelessWidget {
  final List<File> files;
  final void Function(int) onRemove;
  final VoidCallback onAddPressed;

  const FilePreviewList({
    super.key,
    required this.files,
    required this.onRemove,
    required this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < files.length; i++)
          ListTile(
            leading: Image.file(files[i], width: 50, height: 50),
            title: Text(files[i].path.split('/').last),
            subtitle: const Text("2.5 MB · jpg"), // TODO: calculate real size
            trailing: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => onRemove(i),
            ),
          ),
        ElevatedButton(
          onPressed: onAddPressed,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text("+"),
        )
      ],
    );
  }
}
