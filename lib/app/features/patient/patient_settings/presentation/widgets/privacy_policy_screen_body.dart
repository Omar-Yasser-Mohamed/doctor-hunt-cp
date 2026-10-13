import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/features/patient/patient_settings/presentation/widgets/privacy_policy_bullet_item.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyScreenBody extends StatelessWidget {
  const PrivacyPolicyScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 16,
        bottom: context.bottomPadding + 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            t.doctorHuntPrivacyPolicyTitle,
            style: context.bold18TextSub,
          ),
          14.height,
          Text(
            t.privacyPolicyIntro,
            style: context.regular14TextSub.copyWith(height: 1.55),
          ),
          20.height,
          PrivacyPolicyBulletItem(text: t.privacyPolicyPoint1),
          16.height,
          PrivacyPolicyBulletItem(text: t.privacyPolicyPoint2),
          16.height,
          PrivacyPolicyBulletItem(text: t.privacyPolicyPoint3),
          16.height,
          PrivacyPolicyBulletItem(text: t.privacyPolicyPoint4),
          20.height,
          Text(
            t.privacyPolicyOutro,
            style: context.regular14TextSub.copyWith(height: 1.55),
          ),
        ],
      ),
    );
  }
}
