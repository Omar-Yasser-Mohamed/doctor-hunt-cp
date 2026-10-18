import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_outline_button.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelAppointmentButton extends StatelessWidget {
  const CancelAppointmentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppOutlineButton(
      text: t.cancelAppointment,
      height: 36.h,
      radius: 6.r,
      backgroundColor: AppColors.inactiveLight,
      borderColor: AppColors.inactive,
      textStyle: context.medium11.copyWith(color: AppColors.inactive),
      onPressed: () {},
    );
  }
}
