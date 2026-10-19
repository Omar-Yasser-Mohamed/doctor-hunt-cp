import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentDetailsShimmer extends StatelessWidget {
  const AppointmentDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        bottom: context.bottomPadding + 24,
      ),
      child: Column(
        children: [
          8.height,
          const AppointmentPatientCardShimmer(),
          16.height,
          const AppointmentDoctorCardShimmer(),
          16.height,
          const AppointmentScheduleCardShimmer(),
        ],
      ),
    );
  }
}

class AppointmentPatientCardShimmer extends StatelessWidget {
  const AppointmentPatientCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppShimmer(
          child: Container(
            width: 60.w,
            height: 14.h,
            decoration: BoxDecoration(
              color: AppColors.gray200,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ),
        8.height,
        Container(
          padding: const EdgeInsets.all(14),
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
          child: AppShimmer(
            child: Row(
              children: [
                Container(
                  width: 64.w,
                  height: 64.w,
                  decoration: BoxDecoration(
                    color: AppColors.gray200,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                12.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 130.w,
                        height: 16.h,
                        decoration: BoxDecoration(
                          color: AppColors.gray200,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      6.height,
                      Row(
                        children: [
                          Container(
                            width: 14,
                            height: 14,
                            decoration: BoxDecoration(
                              color: AppColors.gray200,
                              borderRadius: BorderRadius.circular(3.r),
                            ),
                          ),
                          8.width,
                          Expanded(
                            child: Container(
                              height: 12.h,
                              decoration: BoxDecoration(
                                color: AppColors.gray200,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AppointmentDoctorCardShimmer extends StatelessWidget {
  const AppointmentDoctorCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppShimmer(
          child: Container(
            width: 60.w,
            height: 14.h,
            decoration: BoxDecoration(
              color: AppColors.gray200,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
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
          child: AppShimmer(
            child: Row(
              children: [
                Container(
                  width: 52.w,
                  height: 52.w,
                  decoration: BoxDecoration(
                    color: AppColors.gray200,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                12.width,
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
                Container(
                  width: 34,
                  height: 34,
                  decoration: const BoxDecoration(
                    color: AppColors.gray200,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AppointmentScheduleCardShimmer extends StatelessWidget {
  const AppointmentScheduleCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppShimmer(
              child: Container(
                width: 90.w,
                height: 14.h,
                decoration: BoxDecoration(
                  color: AppColors.gray200,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),
            AppShimmer(
              child: Container(
                width: 72.w,
                height: 24.h,
                decoration: BoxDecoration(
                  color: AppColors.gray200,
                  borderRadius: BorderRadius.circular(9999),
                ),
              ),
            ),
          ],
        ),
        8.height,
        Container(
          padding: const EdgeInsets.all(14),
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
          child: AppShimmer(
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: _AppointmentDetailTileShimmer(valueWidth: 65),
                    ),
                    10.width,
                    const Expanded(
                      child: _AppointmentDetailTileShimmer(valueWidth: 55),
                    ),
                  ],
                ),
                10.height,
                const _AppointmentDetailTileShimmer(valueWidth: 60),
                10.height,
                const _AppointmentDetailTileShimmer(valueWidth: 140),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _AppointmentDetailTileShimmer extends StatelessWidget {
  const _AppointmentDetailTileShimmer({
    this.valueWidth = 70,
  });

  final double valueWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.adminBackground,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.gray200,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          8.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 44.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                    color: AppColors.gray200,
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                ),
                6.height,
                Container(
                  width: valueWidth.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: AppColors.gray200,
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
