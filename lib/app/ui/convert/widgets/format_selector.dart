import 'package:flutter/material.dart';

class FormatSelector extends StatelessWidget {
  final String? selectedFormat;
  final void Function(String) onFormatSelected;

  const FormatSelector({
    super.key,
    required this.selectedFormat,
    required this.onFormatSelected,
  });

  @override
  Widget build(BuildContext context) {
    final formats = ['PDF', 'JPG', 'PNG', 'DOCX', 'TXT'];
    return Wrap(
      spacing: 12,
      children: formats.map((format) {
        final isSelected = selectedFormat == format;
        return ChoiceChip(
          label: Text(format),
          selected: isSelected,
          //onSelected: (_) => onFormatSelected(format),
        );
      }).toList(),
    );
  }
}
