import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/utils/app_icons.dart';
import 'package:doctor_hunt/app/features/auth/presentation/widgets/shared/o_auth_button.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OAuthSection extends StatelessWidget {
  const OAuthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
            child: OAuthButton(
              image: AppIcons.google,
              text: context.t.auth.google,
            ),
          ),
      
          16.width,
      
          Expanded(
            child: OAuthButton(
              image: AppIcons.facebook,
              text: context.t.auth.facebook,
            ),
          ),
        ],
      ),
    );
  }
}