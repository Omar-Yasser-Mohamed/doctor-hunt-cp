import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientAppointmentsListSliverShimmer extends StatelessWidget {
  const PatientAppointmentsListSliverShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) => const PatientAppointmentCardShimmer(),
    );
  }
}

class PatientAppointmentCardShimmer extends StatelessWidget {
  const PatientAppointmentCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: AppShimmer(
        child: Column(
          children: [
            // Doctor info row
            _buildDoctorInfoRow(),

            10.height,

            // Divider
            Container(
              height: 1,
              color: AppColors.gray200,
            ),

            10.height,

            // Details rows (date, time, fee)
            _buildDetailsSection(),

            10.height,

            // Action buttons row
            _buildActionsRow(),
          ],
        ),
      ),
    );
  }

  /// Doctor photo + name/specialty + status badge skeleton.
  Widget _buildDoctorInfoRow() {
    return Row(
      children: [
        // Doctor photo skeleton
        Container(
          width: 66.w,
          height: 66.w,
          decoration: BoxDecoration(
            color: AppColors.gray200,
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),

        10.width,

        // Name & specialty skeleton
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 120.w,
                height: 16.h,
                decoration: BoxDecoration(
                  color: AppColors.gray200,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              6.height,
              Container(
                width: 90.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: AppColors.gray200,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ],
          ),
        ),

        10.width,

        // Status badge skeleton
        Container(
          width: 64.w,
          height: 22.h,
          decoration: BoxDecoration(
            color: AppColors.gray200,
            borderRadius: BorderRadius.circular(9999),
          ),
        ),
      ],
    );
  }

  /// Appointment date, time, and fee detail tiles skeleton.
  Widget _buildDetailsSection() {
    return Column(
      children: [
        Row(
          children: [
            // Date tile skeleton
            Expanded(child: _buildDetailTileSkeleton(width: 72.w)),
            8.width,
            // Time tile skeleton
            Expanded(child: _buildDetailTileSkeleton(width: 52.w)),
          ],
        ),
        8.height,
        // Fee tile skeleton
        _buildDetailTileSkeleton(width: 44.w),
      ],
    );
  }

  /// Single detail tile skeleton (icon box + label + value).
  Widget _buildDetailTileSkeleton({required double width}) {
    return Row(
      children: [
        // Icon container skeleton
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.gray200,
            borderRadius: BorderRadius.circular(6),
          ),
        ),

        7.width,

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 56.w,
              height: 10.h,
              decoration: BoxDecoration(
                color: AppColors.gray200,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
            4.height,
            Container(
              width: width,
              height: 12.h,
              decoration: BoxDecoration(
                color: AppColors.gray200,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Two action button skeletons.
  Widget _buildActionsRow() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 38.h,
            decoration: BoxDecoration(
              color: AppColors.gray200,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
        10.width,
        Expanded(
          child: Container(
            height: 38.h,
            decoration: BoxDecoration(
              color: AppColors.gray200,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ],
    );
  }
}
