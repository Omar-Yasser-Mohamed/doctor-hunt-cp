import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminSettingsLogoutButton extends StatelessWidget {
  const AdminSettingsLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: t.logout,
      height: 48.h,
      backgroundColor: AppColors.danger.withValues(alpha: 0.1),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.logout,
            color: AppColors.danger,
            size: 20,
          ),
          8.width,
          Text(
            t.logout,
            style: context.semiBold14Danger,
          ),
        ],
      ),
    );
  }
}
