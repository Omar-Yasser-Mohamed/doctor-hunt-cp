import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/shared/enums/doctor_status.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/utils/app_images.dart';
import 'package:doctor_hunt/app/core/widgets/dynamic_rating_stars.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDoctorCard extends StatelessWidget {
  const AdminDoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    final doctorStatus = DoctorStatus.active;
    return GestureDetector(
      onTap: () {
        const AdminDoctorDetailsRoute().push(context);
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  AppImages.doctorTest,
                  width: 51.w,
                  height: 51.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            10.width,

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr. Sara Mohamed",
                    overflow: TextOverflow.ellipsis,
                    style: context.medium16TextMain,
                  ),

                  4.height,

                  Text(
                    "Orthopedic",
                    overflow: TextOverflow.ellipsis,
                    style: context.regular12TextSub,
                  ),

                  4.height,

                  Row(
                    children: [
                      const DynamicRatingStars(
                        rating: 4.7,
                        size: 16,
                      ),

                      4.width,

                      Text(
                        "4.7 • 86 ${t.reviews}",
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
                color: doctorStatus.backgroundColor,
                borderRadius: BorderRadius.circular(9999),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                      color: doctorStatus.color,
                      shape: BoxShape.circle,
                    ),
                  ),

                  5.width,

                  Text(
                    doctorStatus.title,
                    style: TextStyle(
                      fontSize: 9.sp,
                      color: doctorStatus.color,
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
