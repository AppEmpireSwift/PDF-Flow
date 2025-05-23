import 'package:PDF_Flow/style/color.style.dart';
import 'package:PDF_Flow/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:PDF_Flow/app/ui/premium/widgets/premium_banner.dart';

import '../../../core/core.dart';
import '../common/back_button.dart';
import 'widgets/settings_section.dart';
import 'widgets/settings_tile.dart';

class SettingsPage extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (_) => SettingsPage());

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leadingWidth: 70,
        // leading: WABackButton(),
        centerTitle: false,
        title: Text('Settings', style: TextStyles.ForlargeTitleRegular),
      ),
      body: Container (
        color: ColorStyles.Background,
        child:  ListView(
        padding: EdgeInsets.all(16).r,
        children: [
          AutoHiddablePremiumBanner(),
          SizedBox(height: 28.r),

          Builder(
            builder: (context) {
              return SettingsTile(
                title: 'Share ${Core.config.appName}',
                onTap: () {
                  final box = context.findRenderObject() as RenderBox?;

                  shareApp(box!.localToGlobal(Offset.zero) & box.size);
                },
              );
            },
          ),
          SizedBox(height: 12.r),
          SettingsTile(title: 'Rate us', onTap: openRateApp),
          SizedBox(height: 32.r),


          // SettingsSection(
          //   children: [
          //     SettingsTile(
          //       title: 'Resetting results',
          //       onTap: () {
          //         //todo reset
          //       },
          //     ),
          //   ],
          // ),
          // SettingsSection(
          //   children: [SettingsTile(title: 'Contact us', onTap: contactUs)],
          // ),

          // SettingsTile(
          //   title: 'App update',
          //   onTap: () => checkAppUpdate(context),
          // ),
          SettingsTile(
            title: 'Privacy Policy',
            onTap: () => openPrivacyPolicy(context),
          ),
          SizedBox(height: 12.r),
          SettingsTile(
            title: 'Terms of Use',
            onTap: () => openTermsOfUse(context),
          ),
          SizedBox(height: 12.r),

          SettingsTile(title: 'Version', onTap: () => showAppVersion(context)),
        ],
      ),
    ),
    );
  }
}
