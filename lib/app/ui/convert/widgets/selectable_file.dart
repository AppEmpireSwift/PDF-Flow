import 'package:flutter/material.dart';

class SelectableFileWidget extends StatelessWidget {
  final VoidCallback onTap;

  const SelectableFileWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: const SizedBox(
          height: 120,
          child: Center(child: Text("Click here for photo selection")),
        ),
      ),
    );
  }
}
