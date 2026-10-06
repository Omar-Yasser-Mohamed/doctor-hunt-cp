import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/utils/app_icons.dart';
import 'package:doctor_hunt/app/core/widgets/dynamic_rating_stars.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorSummaryCard extends StatelessWidget {
  const DoctorSummaryCard({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          // Specialty Row
          _DoctorSummaryRow(
            icon: SvgPicture.asset(
              AppIcons.medical,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
            label: t.specialty,
            valueChild: Text(
              doctor.specialty.title,
              style: context.semiBold14TextMain,
            ),
          ),

          12.height,
          _buildDivider(),
          12.height,

          // Rating Row
          _DoctorSummaryRow(
            icon: const Icon(
              Icons.star_border,
              color: AppColors.primary,
              size: 24,
            ),
            label: t.rating,
            valueChild: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                DynamicRatingStars(
                  rating: doctor.rating,
                  size: 16,
                ),
                6.width,
                Text(
                  "${doctor.rating} • ${doctor.reviewsCount} ${t.reviews}",
                  style: context.regular11TextSub.copyWith(
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),

          12.height,
          _buildDivider(),
          12.height,

          // Fee Row
          _DoctorSummaryRow(
            icon: const Icon(
              Icons.monetization_on_outlined,
              color: AppColors.primary,
              size: 24,
            ),
            label: t.consultationFee,
            valueChild: Text(
              "\$${doctor.fees.toStringAsFixed(2)}",
              style: context.semiBold14TextMain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      color: AppColors.graySoft,
    );
  }
}

class _DoctorSummaryRow extends StatelessWidget {
  const _DoctorSummaryRow({
    required this.icon,
    required this.label,
    required this.valueChild,
  });

  final Widget icon;
  final String label;
  final Widget valueChild;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.activeLight,
            borderRadius: BorderRadius.circular(10),
          ),
          child: icon,
        ),
        12.width,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: context.regular12TextSub,
              ),
              2.height,
              valueChild,
            ],
          ),
        ),
      ],
    );
  }
}
