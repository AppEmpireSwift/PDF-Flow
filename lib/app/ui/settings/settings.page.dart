import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wa_skeleton/app/ui/premium/widgets/premium_banner.dart';

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
        leadingWidth: 70,
        leading: WABackButton(),
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16).r,
        children: [
          SettingsSection(
            children: [
              SettingsTile(
                title: 'Current version',
                onTap: () => showAppVersion(context),
              ),
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
              SettingsTile(title: 'Rate App', onTap: openRateApp),
            ],
          ),
          SizedBox(height: 8.r),
          AutoHiddablePremiumBanner(),
          SizedBox(height: 8.r),

          SettingsSection(
            children: [
              SettingsTile(
                title: 'Resetting results',
                onTap: () {
                  //todo reset
                },
              ),
            ],
          ),
          SizedBox(height: 16.r),
          SettingsSection(
            children: [SettingsTile(title: 'Contact us', onTap: contactUs)],
          ),
          SizedBox(height: 16.r),
          SettingsSection(
            children: [
              SettingsTile(
                title: 'App update',
                onTap: () => checkAppUpdate(context),
              ),

              SettingsTile(
                title: 'Privacy Policy',
                onTap: () => openPrivacyPolicy(context),
              ),
              SettingsTile(
                title: 'Terms of Use',
                onTap: () => openTermsOfUse(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
