import 'package:flutter/material.dart';

class FileItemTile extends StatelessWidget {
  // final String iconPath;
  final String fileName;
  final String date;
  final VoidCallback onTap;
  final VoidCallback onMorePressed;

  const FileItemTile({
    super.key,
    //  required this.iconPath,
    required this.fileName,
    required this.date,
    required this.onTap,
    required this.onMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
    ],
  ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        //elevation: 2, // можно добавить тень, если хочешь
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
        padding: const EdgeInsets.all(12),
           child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 📄 Иконка файла
              // Image.asset(
              //   iconPath,
              //   width: 32,
              //   height: 32,
              // ),
              // const SizedBox(width: 12),

              /// 📄 Название файла и дата
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fileName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ),

              /// ☰ Кнопка с троеточием
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: onMorePressed,
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}
