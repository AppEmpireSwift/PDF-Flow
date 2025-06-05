import 'dart:ui';
import 'package:PDF_Flow/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const LoadingOverlay({Key? key, required this.isLoading, required this.child})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,

        // Блюр + overlay при isLoading
        if (isLoading)
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                
                color: Colors.black.withOpacity(0.2),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.sync, color: Colors.white, size: 64),
                    SizedBox(height: 12.h),
                    Text('Converted...', style: TextStyle(color: ColorStyles.Black, fontSize: 16), overflow: TextOverflow.clip,) // или TextOverflow.clip),

                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
