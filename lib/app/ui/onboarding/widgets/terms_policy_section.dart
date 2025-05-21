import 'package:apphud_helper/apphud_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';
import '../../../../style/style.dart';

class TermsAndPolicySection extends StatelessWidget {
  const TermsAndPolicySection({super.key});

  @override
  Widget build(BuildContext context) {

    return Opacity(
      opacity: 0.4,
      child: SizedBox(
        height: 21.spMin, // Устанавливаем высоту явно
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLink(
              context,
              label: 'Terms of Use',
              onTap: () {
                HapticFeedback.lightImpact();
                openTermsOfUse(context);
              },
            ),
            _buildDivider(),
            _buildLink(
              context,
              label: 'Privacy Policy',
              onTap: () {
                HapticFeedback.lightImpact();
                openPrivacyPolicy(context);
              },
            ),
            _buildDivider(),
            SeparateRestorePurchaseButtonBuilder(
              buttonBuilder: (buttonText, onPressed) {
                return _buildLink(
                  context,
                  label: buttonText,
                  onTap: () {
                    HapticFeedback.lightImpact();
                    onPressed.call();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLink(BuildContext context,
      {required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: EdgeInsets.symmetric(horizontal: 8.r),
        child: Center(
          child: Text(label, style: TextStyles.footnoteRegular),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: double.infinity,
      width: 1,
      color: Colors.grey, // Цвет разделителя
      margin: EdgeInsets.symmetric(horizontal: 8.r),
    );
  }
}

