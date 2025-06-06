import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:PDF_Flow/style/color.style.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/appbar.dart';
import 'package:PDF_Flow/app/ui/files/widgets/file_item_tile.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/loading_overlay.dart';
import 'package:PDF_Flow/app/ui/convert/widgets/conversion_success.dart';

class MergePage extends StatefulWidget {
  const MergePage({super.key});

  @override
  State<MergePage> createState() => _MergePageState();
}

class _MergePageState extends State<MergePage> {
  bool dragMode = false;
  bool isMerging = false;
  bool isMerged = false;

  List<Map<String, String>> files = [
    {'fileName': 'File_0.pdf', 'date': '2025-02-10 04:23 PM'},
    {'fileName': 'File_1.pdf', 'date': '2025-02-10 04:23 PM'},
    {'fileName': 'File_2.pdf', 'date': '2025-02-10 04:23 PM'},
  ];

  late List<bool> selectedFiles;
  List<Map<String, String>> selectedForMerge = [];

  @override
  void initState() {
    super.initState();
    selectedFiles = List<bool>.filled(files.length, false);
  }

  void _startMerge() async {
    setState(() {
      isMerging = true;
    });

    // Симулируем длительность merge-процесса
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isMerging = false;
      isMerged = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool anySelected = selectedFiles.any((selected) => selected);

    return LoadingOverlay(
      isLoading: isMerging,
      child: Scaffold(
        backgroundColor: ColorStyles.Background,
        appBar: CustomAppBar(
          title: 'Merge Files into PDF',
          backgroundColor: ColorStyles.Background,
        ),
        body: isMerged
            ? const ConversionSuccess(text: 'The merger is complete',)
            : Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 24.h, left: 16.w),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'You can arrange the files in the order in which you want to\n merge them',
                        style: TextStyle(fontSize: 10.sp, color: ColorStyles.Grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Expanded(
                    child: dragMode
                        ? ReorderableListView.builder(
                            padding: const EdgeInsets.only(bottom: 16),
                            itemCount: selectedForMerge.length,
                            onReorder: (oldIndex, newIndex) {
                              setState(() {
                                if (newIndex > oldIndex) newIndex--;
                                final item = selectedForMerge.removeAt(oldIndex);
                                selectedForMerge.insert(newIndex, item);
                              });
                            },
                            itemBuilder: (context, index) {
                              final file = selectedForMerge[index];
                              return FileItemTile(
                                key: ValueKey(file['fileName']),
                                fileName: file['fileName']!,
                                date: file['date']!,
                                isDragMode: true,
                              );
                            },
                          )
                        : ListView.builder(
                            itemCount: files.length,
                            itemBuilder: (context, index) {
                              final file = files[index];
                              return FileItemTile(
                                fileName: file['fileName']!,
                                date: file['date']!,
                                isSelectable: true,
                                isSelected: selectedFiles[index],
                                onSelectedChanged: (selected) {
                                  setState(() {
                                    selectedFiles[index] = selected!;
                                  });
                                },
                                onTapDown: (_) {},
                                onMorePressed: () {},
                              );
                            },
                          ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.r),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: dragMode
                          ? _startMerge
                          : anySelected
                              ? () {
                                  setState(() {
                                    dragMode = true;
                                    selectedForMerge = [];
                                    for (int i = 0; i < files.length; i++) {
                                      if (selectedFiles[i]) {
                                        selectedForMerge.add(files[i]);
                                      }
                                    }
                                  });
                                }
                              : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            dragMode || anySelected ? ColorStyles.Red : Colors.grey,
                        foregroundColor: Colors.white,
                        minimumSize: Size.fromHeight(56.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Text(
                        dragMode ? 'Merge' : 'Next',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
