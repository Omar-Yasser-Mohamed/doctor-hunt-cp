import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/core/widgets/app_outline_button.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsActions extends StatelessWidget {
  const DoctorDetailsActions({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppButton(
          text: t.editDoctor,
          height: 52.h,
          radius: 12.r,
          onPressed: () {
            EditDoctorRoute(doctor).push(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.edit_outlined,
                size: 20,
                color: AppColors.white,
              ),

              8.width,

              Text(
                t.editDoctor,
                style: context.semiBold16White,
              ),
            ],
          ),
        ),

        12.height,

        AppOutlineButton(
          text: t.manageAvailability,
          height: 48.h,
          radius: 12.r,
          backgroundColor: AppColors.white,
          borderColor: AppColors.borderGreenSoft,
          onPressed: () {
            // Manage availability action
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.delete_outline,
                size: 20,
                color: AppColors.primary,
              ),

              6.width,

              Text(
                t.manageAvailability,
                style: context.semiBold14Primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
