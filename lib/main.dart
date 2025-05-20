import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:apphud_helper/apphud_helper.dart';

import 'app/app.dart';
import 'app/ui/onboarding/onboarding.page.dart';
import 'app/ui/root/home.page.dart';
import 'app/ui/splash.page.dart';
import 'core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Core.init(
    //todo fill the config
    config: CommonConfig(
      appName: 'PDF_Flow',

      ///base iphone size
      figmaDesignSize: Size(375, 812),
      appId: '111111111',
      appHudKey: 'app_HorEUWWedWd1V683fWnwZwZFLfvZEr',
      supportEmail: 'support@email.com',
    ),
    home: HomePage(),
    splash: SplashPage(),
    onBoarding: OnBoardingPage(),
  );
  ApphudHelper.configure(
    ApphudHelperConfig(
      apiKey: Core.config.appHudKey,
      productTexts: ProductTexts(),
      dialogs: DialogTexts(),
      defaultActiveProductPeriod: 'Week', //periodly from apphud json
      fallbacks: CommonFallbackTexts(restoreButtonText: 'Restore'),
      //todo return true
      /// set false to check last page at onboarding
      /// but better - create .storekit config at xcode
      skipOnBoardingPaywallOnError: false,
    ),
    helperType: HelperType.apphud,
  );
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) {
        return const ArithmeticAdventure();
      },
    ),
  );
}
