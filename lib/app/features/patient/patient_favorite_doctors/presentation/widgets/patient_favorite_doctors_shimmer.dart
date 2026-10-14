import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientFavoriteDoctorCardShimmer extends StatelessWidget {
  const PatientFavoriteDoctorCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Favorite heart skeleton
          PositionedDirectional(
            top: 10,
            end: 10,
            child: AppShimmerBox(
              width: 18.w,
              height: 18.w,
              borderRadius: 4.r,
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  18.height,
                  // Avatar skeleton
                  AppShimmerBox.circular(
                    size: 84.w,
                  ),
                  12.height,
                  // Name skeleton
                  AppShimmerBox(
                    width: 90.w,
                    height: 14.h,
                    borderRadius: 4.r,
                  ),
                  6.height,
                  // Specialty skeleton
                  AppShimmerBox(
                    width: 110.w,
                    height: 12.h,
                    borderRadius: 4.r,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PatientFavoriteDoctorsGridShimmer extends StatelessWidget {
  const PatientFavoriteDoctorsGridShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 16,
        bottom: context.bottomPadding + 16,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 15.h,
        childAspectRatio: 160 / 180,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return const PatientFavoriteDoctorCardShimmer();
      },
    );
  }
}
