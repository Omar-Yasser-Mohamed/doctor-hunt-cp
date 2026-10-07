import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDoctorAvailabilityTimePickerField extends StatelessWidget {
  const AdminDoctorAvailabilityTimePickerField({
    super.key,
    required this.label,
    required this.time,
    required this.onTimeChanged,
  });

  final String label;
  final TimeOfDay time;
  final ValueChanged<TimeOfDay> onTimeChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label.toUpperCase(),
          style: context.semiBold11TextSub,
        ),
        6.height,
        InkWell(
          onTap: () async {
            final picked = await showTimePicker(
              context: context,
              initialTime: time,
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(
                      primary: AppColors.primary,
                      onPrimary: AppColors.white,
                      onSurface: AppColors.textMain,
                    ),
                  ),
                  child: child!,
                );
              },
            );
            if (picked != null) {
              onTimeChanged(picked);
            }
          },
          borderRadius: BorderRadius.circular(10.r),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.access_time_rounded,
                  size: 20,
                  color: AppColors.successSoft,
                ),
                8.width,
                Expanded(
                  child: Text(
                    time.format(context),
                    style: context.medium14TextMain,
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 20,
                  color: AppColors.textSub,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
