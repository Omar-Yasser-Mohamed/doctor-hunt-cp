import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDoctorAvailabilityShimmer extends StatelessWidget {
  const AdminDoctorAvailabilityShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 16,
        bottom: context.bottomPadding + 16,
      ),
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Doctor context shimmer
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              children: [
                AppShimmerBox(
                  width: 52.w,
                  height: 52.w,
                  borderRadius: 12.r,
                ),
                12.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppShimmerBox(width: 120.w, height: 16.h, borderRadius: 4.r),
                      6.height,
                      AppShimmerBox(width: 160.w, height: 12.h, borderRadius: 4.r),
                    ],
                  ),
                ),
                8.width,
                AppShimmerBox(width: 55.w, height: 22.h, borderRadius: 9999),
              ],
            ),
          ),
      
          14.height,
      
          // Working days section shimmer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppShimmerBox(width: 90.w, height: 14.h, borderRadius: 4.r),
              AppShimmerBox(width: 80.w, height: 12.h, borderRadius: 4.r),
            ],
          ),
      
          8.height,
      
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: List.generate(7, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const AppShimmerBox(width: 28, height: 28, borderRadius: 8),
                          10.width,
                          AppShimmerBox(
                            width: 80.w,
                            height: 14.h,
                            borderRadius: 4.r,
                          ),
                        ],
                      ),
                      const AppShimmerBox(width: 36, height: 20, borderRadius: 9999),
                    ],
                  ),
                );
              }),
            ),
          ),
      
          14.height,
      
          // Working hours section shimmer
          AppShimmerBox(width: 100.w, height: 14.h, borderRadius: 4.r),
      
          8.height,
      
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AppShimmerBox(height: 44.h, borderRadius: 10.r),
                    ),
                    10.width,
                    Expanded(
                      child: AppShimmerBox(height: 44.h, borderRadius: 10.r),
                    ),
                  ],
                ),
                12.height,
                AppShimmerBox(height: 44.h, borderRadius: 10.r),
              ],
            ),
          ),
      
          18.height,
      
          // Save button shimmer
          AppShimmerBox(height: 52.h, borderRadius: 12.r),
        ],
      ),
    );
  }
}
