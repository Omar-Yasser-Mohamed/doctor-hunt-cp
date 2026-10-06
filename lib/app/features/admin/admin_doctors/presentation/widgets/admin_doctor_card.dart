import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/custom_network_image.dart';
import 'package:doctor_hunt/app/core/widgets/dynamic_rating_stars.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDoctorCard extends StatelessWidget {
  const AdminDoctorCard({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    final isActive = doctor.isActive;
    return GestureDetector(
      onTap: () {
        AdminDoctorDetailsRoute(doctorId: doctor.id).push(context);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 52.w,
              height: 52.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: CustomNetworkImage(
                imageUrl: doctor.photo!,
                fit: BoxFit.cover,
                radius: 12,
                width: 51.w,
                height: 51.w,
              ),
            ),

            10.width,

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    overflow: TextOverflow.ellipsis,
                    style: context.medium16TextMain,
                  ),

                  4.height,

                  Text(
                    doctor.specialty.title,
                    overflow: TextOverflow.ellipsis,
                    style: context.regular12TextSub,
                  ),

                  2.height,

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      DynamicRatingStars(
                        rating: doctor.rating,
                        size: 18,
                      ),

                      4.width,

                      Text(
                        "${doctor.rating} • ${doctor.reviewsCount} ${t.reviews}",
                        style: context.regular11TextSub.copyWith(
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.activeLight
                    : AppColors.inactiveLight,
                borderRadius: BorderRadius.circular(9999),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                      color: isActive
                          ? AppColors.cardiology
                          : AppColors.inactive,
                      shape: BoxShape.circle,
                    ),
                  ),

                  5.width,

                  Text(
                    isActive ? t.active : t.inactive,
                    style: TextStyle(
                      fontSize: 9.sp,
                      color: isActive
                          ? AppColors.cardiology
                          : AppColors.inactive,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
