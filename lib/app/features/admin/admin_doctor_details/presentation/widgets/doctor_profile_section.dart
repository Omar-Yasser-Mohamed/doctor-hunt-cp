import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/custom_network_image.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorProfileSection extends StatelessWidget {
  const DoctorProfileSection({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    final isActive = doctor.isActive;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 112.w,
              height: 112.w,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.05),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: doctor.photo != null && doctor.photo!.trim().isNotEmpty
                  ? CustomNetworkImage(
                      imageUrl: doctor.photo!,
                      fit: BoxFit.cover,
                      radius: 9999,
                      width: 112.w,
                      height: 112.w,
                    )
                  : const SizedBox.shrink(),
            ),

            Positioned.directional(
              textDirection: Directionality.of(context),
              bottom: 0,
              end: 0,
              child: Container(
                padding: const EdgeInsets.all(9),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.verified,
                  color: AppColors.white,
                  size: 18,
                ),
              ),
            ),
          ],
        ),

        16.height,

        Text(
          doctor.name,
          textAlign: TextAlign.center,
          style: context.bold24TextMain,
        ),

        6.height,

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: isActive ? AppColors.activeLight : AppColors.inactiveLight,
            borderRadius: BorderRadius.circular(9999),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isActive ? AppColors.cardiology : AppColors.inactive,
                  shape: BoxShape.circle,
                ),
              ),
              6.width,
              Text(
                isActive ? t.active : t.inactive,
                style: context.semiBold12.copyWith(
                  color: isActive ? AppColors.cardiology : AppColors.inactive,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
