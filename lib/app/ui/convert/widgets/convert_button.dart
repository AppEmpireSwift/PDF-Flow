import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConvertButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onPressed;

  const ConvertButton({
    super.key,
    required this.isEnabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity, // растягивает на всю доступную ширину
          child: ElevatedButton(
            onPressed: isEnabled ? onPressed : null,
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(56),
              backgroundColor: isEnabled ? Colors.red : Colors.red.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: const Text("Convert"),
          ),
        ),
      ),
    );
  }
}
