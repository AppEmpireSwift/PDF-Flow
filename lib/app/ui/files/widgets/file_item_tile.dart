// import 'package:flutter/material.dart';

// class FileItemTile extends StatelessWidget {
//   // final String iconPath;
//   final String fileName;
//   final String date;
//   final GestureTapDownCallback onTapDown;
//   final VoidCallback onMorePressed;

//   const FileItemTile({
//     super.key,
//     //  required this.iconPath,
//     required this.fileName,
//     required this.date,
//     required this.onTapDown,
//     required this.onMorePressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(12),
//     boxShadow: [
//       BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
//     ],
//   ),
//       child: Material(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         //elevation: 2, // можно добавить тень, если хочешь
//         child: InkWell(
//           onTapDown: onTapDown,
//           borderRadius: BorderRadius.circular(12),
//           child: Padding(
//         padding: const EdgeInsets.all(12),
//            child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// 📄 Иконка файла
//               // Image.asset(
//               //   iconPath,
//               //   width: 32,
//               //   height: 32,
//               // ),
//               // const SizedBox(width: 12),

//               /// 📄 Название файла и дата
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       fileName,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       date,
//                       style: const TextStyle(color: Colors.grey, fontSize: 13),
//                     ),
//                   ],
//                 ),
//               ),

//               /// ☰ Кнопка с троеточием
//               IconButton(
//                 icon: const Icon(Icons.more_vert),
//                 onPressed: onMorePressed,
//               ),
//             ],
//           ),
//         ),
//         ),
//       ),
//     );
//   }
// }

// Обновлённый FileItemTile с поддержкой режима выбора
// import 'package:flutter/material.dart';

// class FileItemTile extends StatelessWidget {
//   final String fileName;
//   final String date;
//   final GestureTapDownCallback onTapDown;
//   final VoidCallback onMorePressed;
//   final bool isSelectable;
//   final bool isSelected;
//   final ValueChanged<bool?>? onSelectedChanged;

//   const FileItemTile({
//     super.key,
//     required this.fileName,
//     required this.date,
//     required this.onTapDown,
//     required this.onMorePressed,
//     this.isSelectable = false,
//     this.isSelected = false,
//     this.onSelectedChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
//         ],
//       ),
//       child: Material(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         // child: InkWell(
//         //   onTapDown: onTapDown,
//         //   borderRadius: BorderRadius.circular(12),
//         child: Padding(
//           padding: const EdgeInsets.all(12),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       fileName,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       date,
//                       style: const TextStyle(color: Colors.grey, fontSize: 13),
//                     ),
//                   ],
//                 ),
//               ),
//               isSelectable
//                   ? Checkbox(
//                     value: isSelected,
//                     shape: const CircleBorder(),
//                     onChanged: (bool? value) {
//                       if (value != null) {
//                         onSelectedChanged!(value);
//                       }
//                     },
//                   )
//                   : IconButton(
//                     icon: const Icon(Icons.more_vert),
//                     onPressed: onMorePressed,
//                   ),
//             ],
//           ),
//         ),
//         //),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class FileItemTile extends StatelessWidget {
  final String fileName;
  final String date;
  final GestureTapDownCallback? onTapDown;
  final VoidCallback? onMorePressed;
  final bool isSelectable;
  final bool isSelected;
  final ValueChanged<bool?>? onSelectedChanged;
  final bool isDragMode;

  const FileItemTile({
    super.key,
    required this.fileName,
    required this.date,
    this.onTapDown,
    this.onMorePressed,
    this.isSelectable = false,
    this.isSelected = false,
    this.onSelectedChanged,
    this.isDragMode = false,
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
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isDragMode) ...[
                const Icon(Icons.picture_as_pdf, color: Colors.red),
                const SizedBox(width: 12),
              ],
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
              if (isSelectable && !isDragMode)
                Checkbox(
                  value: isSelected,
                  shape: const CircleBorder(),
                  onChanged: (bool? value) {
                    if (value != null && onSelectedChanged != null) {
                      onSelectedChanged!(value);
                    }
                  },
                )
              else if (!isSelectable && onMorePressed != null)
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: onMorePressed,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
