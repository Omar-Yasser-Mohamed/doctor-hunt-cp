import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordHeader extends StatelessWidget {
  const ChangePasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.lock_reset_rounded,
              color: AppColors.primary,
              size: 24,
            ),
          ),
          12.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.changePassword,
                  style: context.bold16TextMain,
                ),
                4.height,
                Text(
                  t.changePasswordDescription,
                  style: context.regular12TextSub,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
