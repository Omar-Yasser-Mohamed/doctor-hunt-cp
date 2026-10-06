import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditDoctorStatusCard extends StatelessWidget {
  const EditDoctorStatusCard({
    super.key,
    required this.isActive,
    required this.onChanged,
  });

  final bool isActive;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.border,
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.graySoft,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.check_circle_outline_rounded,
              color: AppColors.primary,
              size: 20,
            ),
          ),

          12.width,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.doctorStatus,
                  style: context.semiBold14TextMain,
                ),
                Text(
                  isActive ? t.activeAndAvailable : t.inactiveAndUnavailable,
                  style: context.regular12TextSub,
                ),
              ],
            ),
          ),

          Switch.adaptive(
            value: isActive,
            onChanged: onChanged,
            activeTrackColor: AppColors.primary,
            inactiveThumbColor: AppColors.textPlaceholder,
            trackOutlineColor: WidgetStatePropertyAll(
              isActive ? Colors.transparent : AppColors.textPlaceholder,
            ),
          ),
        ],
      ),
    );
  }
}
