import 'package:flutter/material.dart';

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/core.dart';
import '../core/services/ui.helper.dart';
import '../style/style.dart';

late UIHelper uiHelper;

class ArithmeticAdventure extends StatelessWidget {
  const ArithmeticAdventure({super.key});

  @override
  Widget build(BuildContext context) {
    uiHelper = UIHelper.of(context);
    return ScreenUtilInit(
      designSize: Core.config.figmaDesignSize,
      minTextAdapt: false,
      useInheritedMediaQuery: true,
      builder: (context, _) {
        ///or CupertinoApp without appThemeBuilder
        return MaterialApp(
          title: Core.config.appName,
          theme: appThemeBuilder(context),
          locale: const Locale('en'),
          builder:
              (context, child) =>
                  KeyboardDismissOnTap(child: child ?? Container()),
          home: const Loading(),

          /// all routes from core:
          // initialRoute: '/',
          // routes: {
          //   '/': (_) => Loading(),
          //   '/onboarding': (_) => Boarding(),
          //   '/home': (_) => Home(),
          // },
        );
      },
    );
  }
}
