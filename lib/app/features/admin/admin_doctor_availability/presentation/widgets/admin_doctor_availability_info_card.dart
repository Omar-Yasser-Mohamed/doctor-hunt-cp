import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/string_extentions.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/custom_network_image.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDoctorAvailabilityInfoCard extends StatelessWidget {
  const AdminDoctorAvailabilityInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final doctor = context.extra<DoctorModel>();
    final isActive = doctor.isActive;

    return Container(
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
          // Doctor Image / Avatar
          Container(
            width: 52.w,
            height: 52.w,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12.r),
            ),
            clipBehavior: Clip.antiAlias,
            child: doctor.photo != null && doctor.photo!.isNotEmpty
                ? CustomNetworkImage(
                    imageUrl: doctor.photo!,
                    fit: BoxFit.cover,
                    radius: 12.r,
                    width: 52.w,
                    height: 52.w,
                  )
                : Center(
                    child: Text(
                      doctor.name.toAvatar,
                      style: context.bold16White,
                    ),
                  ),
          ),

          12.width,

          // Doctor Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  doctor.name,
                  style: context.semiBold16TextMain,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                3.height,
                Text(
                  doctor.address != null && doctor.address!.isNotEmpty
                      ? '${doctor.specialty.title} · ${doctor.address}'
                      : doctor.specialty.title,
                  style: context.regular12TextSub,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          8.width,

          // Status Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
            decoration: BoxDecoration(
              color: isActive
                  ? AppColors.primaryLight
                  : AppColors.inactive.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(9999),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.primary : AppColors.inactive,
                    shape: BoxShape.circle,
                  ),
                ),
                5.width,
                Text(
                  isActive ? t.active : t.inactive,
                  style: isActive
                      ? context.medium11Primary
                      : context.medium11TextSub,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
