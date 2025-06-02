import 'package:flutter/material.dart';

class ConversionSuccess extends StatelessWidget {
  const ConversionSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 48),
        const Icon(Icons.check_circle, size: 80, color: Colors.green),
        const Text("Conversion completed", style: TextStyle(fontSize: 18)),
        const SizedBox(height: 20),
        const Text("JPG_File_3456789_234.jpg"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.edit),
            SizedBox(width: 16),
            Icon(Icons.share),
          ],
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text("Save"),
        )
      ],
    );
  }
}
