import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Sliver list of [AdminAppointmentCardShimmer]s for appointments list loading states.
class AdminAppointmentsListSliverShimmer extends StatelessWidget {
  const AdminAppointmentsListSliverShimmer({
    super.key,
    this.itemCount = 5,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) => const AdminAppointmentCardShimmer(),
    );
  }
}

/// Shimmer placeholder matching [AdminAppointmentCard].
/// Includes single button shimmer for the card action.
class AdminAppointmentCardShimmer extends StatelessWidget {
  const AdminAppointmentCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: AppShimmer(
        child: Column(
          children: [
            _buildPatientAndDoctorRow(),

            14.height,

            Container(
              height: 1,
              color: AppColors.gray200,
            ),

            14.height,

            _buildDetailsRow(),

            14.height,

            _buildActionRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientAndDoctorRow() {
    return Row(
      children: [
        Container(
          width: 48.w,
          height: 48.w,
          decoration: BoxDecoration(
            color: AppColors.gray200,
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),

        10.width,

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 120.w,
                height: 14.h,
                decoration: BoxDecoration(
                  color: AppColors.gray200,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),

              5.height,

              Container(
                width: 90.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: AppColors.gray200,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),

              4.height,

              Container(
                width: 70.w,
                height: 11.h,
                decoration: BoxDecoration(
                  color: AppColors.gray200,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ],
          ),
        ),

        10.width,

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

  Widget _buildDetailsRow() {
    return Row(
      children: [
        Expanded(child: _buildDetailTileSkeleton(width: 58.w)),
        6.width,
        Expanded(child: _buildDetailTileSkeleton(width: 48.w)),
        6.width,
        Expanded(child: _buildDetailTileSkeleton(width: 36.w)),
      ],
    );
  }

  Widget _buildDetailTileSkeleton({required double width}) {
    return Row(
      children: [
        Container(
          width: 33,
          height: 33,
          decoration: BoxDecoration(
            color: AppColors.gray200,
            borderRadius: BorderRadius.circular(8),
          ),
        ),

        6.width,

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 28.w,
                height: 9.h,
                decoration: BoxDecoration(
                  color: AppColors.gray200,
                  borderRadius: BorderRadius.circular(3.r),
                ),
              ),

              4.height,

              Container(
                width: width,
                height: 11.h,
                decoration: BoxDecoration(
                  color: AppColors.gray200,
                  borderRadius: BorderRadius.circular(3.r),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionRow() {
    return Container(
      width: double.infinity,
      height: 36.h,
      decoration: BoxDecoration(
        color: AppColors.gray200,
        borderRadius: BorderRadius.circular(6.r),
      ),
    );
  }
}
