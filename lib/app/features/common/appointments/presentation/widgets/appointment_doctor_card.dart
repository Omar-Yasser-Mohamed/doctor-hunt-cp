import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/string_extentions.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/custom_network_image.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentDoctorCard extends StatelessWidget {
  const AppointmentDoctorCard({super.key, required this.doctor});

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    final doctorPhoto = doctor.photo?.trim() ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.doctor,
          style: context.bold14TextMain,
        ),
        8.height,
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              if (doctorPhoto.isNotEmpty)
                CustomNetworkImage(
                  imageUrl: doctorPhoto,
                  width: 52.w,
                  height: 52.w,
                  radius: 12.r,
                )
              else
                Container(
                  width: 52.w,
                  height: 52.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    doctor.name.toAvatar,
                    style: context.bold16White,
                  ),
                ),
              12.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.semiBold16TextMain,
                    ),
                    2.height,
                    Text(
                      doctor.specialty.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.regular12TextSub,
                    ),
                  ],
                ),
              ),
              10.width,
              Container(
                padding: const EdgeInsets.all(7),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.activeLight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.verified_outlined,
                  size: 20,
                  color: AppColors.successSoft,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
