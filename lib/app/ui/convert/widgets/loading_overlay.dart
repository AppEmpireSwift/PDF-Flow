import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.sync, size: 64, color: Colors.red),
          SizedBox(height: 12),
          Text("Converted...", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
