import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Full screen shimmer for the Admin Doctor Details screen.
/// Matches the layout of [DoctorProfileSection], [DoctorSummaryCard],
/// and [DoctorDetailsActions].
class AdminDoctorDetailsShimmer extends StatelessWidget {
  const AdminDoctorDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        left: 20.w,
        top: 16,
        right: 20.w,
        bottom: context.bottomPadding + 24,
      ),
      child: Column(
        children: [
          const _DoctorProfileShimmer(),
          20.height,
          const _DoctorSummaryCardShimmer(),
          24.height,
          const _DoctorActionsShimmer(),
        ],
      ),
    );
  }
}

/// Shimmer matching [DoctorProfileSection].
class _DoctorProfileShimmer extends StatelessWidget {
  const _DoctorProfileShimmer();

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Circular Avatar Placeholder
          Container(
            width: 112.w,
            height: 112.w,
            decoration: const BoxDecoration(
              color: AppColors.gray200,
              shape: BoxShape.circle,
            ),
          ),

          16.height,

          // Doctor Name Placeholder
          Container(
            width: 150.w,
            height: 24.h,
            decoration: BoxDecoration(
              color: AppColors.gray200,
              borderRadius: BorderRadius.circular(6.r),
            ),
          ),

          6.height,

          // Status Pill Placeholder
          Container(
            width: 70.w,
            height: 24.h,
            decoration: BoxDecoration(
              color: AppColors.gray200,
              borderRadius: BorderRadius.circular(9999),
            ),
          ),
        ],
      ),
    );
  }
}

/// Shimmer matching [DoctorSummaryCard].
class _DoctorSummaryCardShimmer extends StatelessWidget {
  const _DoctorSummaryCardShimmer();

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
      child: AppShimmer(
        child: Column(
          children: [
            const _SummaryRowShimmer(),
            12.height,
            Container(height: 1, color: AppColors.graySoft),
            12.height,
            const _SummaryRowShimmer(),
            12.height,
            Container(height: 1, color: AppColors.graySoft),
            12.height,
            const _SummaryRowShimmer(),
          ],
        ),
      ),
    );
  }
}

/// Shimmer row matching [_DoctorSummaryRow].
class _SummaryRowShimmer extends StatelessWidget {
  const _SummaryRowShimmer();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.gray200,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        12.width,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: AppColors.gray200,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              6.height,
              Container(
                width: 100.w,
                height: 14.h,
                decoration: BoxDecoration(
                  color: AppColors.gray200,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Shimmer matching [DoctorDetailsActions].
class _DoctorActionsShimmer extends StatelessWidget {
  const _DoctorActionsShimmer();

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Edit Doctor Button Skeleton
          Container(
            height: 52.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.gray200,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),

          12.height,

          // Manage Availability Button Skeleton
          Container(
            height: 48.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.gray200,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ],
      ),
    );
  }
}
