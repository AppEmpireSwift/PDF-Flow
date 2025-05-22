import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:PDF_Flow/app/app.dart';
import 'package:PDF_Flow/app/ui/premium/widgets/premium_banner.dart';
import 'package:PDF_Flow/app/ui/settings/settings.page.dart';
import 'package:PDF_Flow/app/ui/statistic/widgets/week_stats.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';
import '../../../gen/assets.gen.dart';
import '../../../style/style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      title: Text('File Converter', style: TextStyles.ForlargeTitleRegular),
        centerTitle: false,

        automaticallyImplyLeading: false,
        titleSpacing: 10.r,
        actions: [
          IconButton(
            onPressed: () {},

             icon: SvgPicture.asset(Assets.vectors.statistic),
          ),

          IconButton(
            onPressed: () {
              Navigator.of(
                context,
                rootNavigator: true,
              ).push(SettingsPage.route());
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                ColorStyles.indigoWithOpacity,
              ),
            ),

            icon: SvgPicture.asset(Assets.vectors.settings),
          ),
        ],
      ),
      
      body: ListView(
        padding: EdgeInsets.all(16).r,
        children: [
          Builder(
            builder: (context) {
              if (uiHelper.isIpad && uiHelper.isLandscape) {
                return SizedBox(
                  height: 120.r,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: WeekStats(weekStats: [true, false]),
                      ),
                      SizedBox(width: 12.r),
                      Expanded(
                        flex: 2,
                        child: AutoHiddablePremiumBanner(
                          margin: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Column(
                children: [
                  WeekStats(weekStats: [true, false]),
                  AutoHiddablePremiumBanner(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
