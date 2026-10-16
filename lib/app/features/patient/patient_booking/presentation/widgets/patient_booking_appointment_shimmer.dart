import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientBookingAppointmentScreenShimmer extends StatelessWidget {
  const PatientBookingAppointmentScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: AppointmentDateSelectionShimmer(),
        ),

        SliverToBoxAdapter(child: 20.height),

        SliverToBoxAdapter(
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Container(
              margin: EdgeInsetsDirectional.only(start: 24.w),
              child: AppShimmerBox(
                width: 130.w,
                height: 18.h,
                borderRadius: 4.r,
              ),
            ),
          ),
        ),

        SliverToBoxAdapter(child: 16.height),

        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          sliver: const AppointmentAvailableSlotsGridSliverShimmer(),
        ),
      ],
    );
  }
}

class AppointmentDateSelectionShimmer extends StatelessWidget {
  const AppointmentDateSelectionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmerBox(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 8),
      height: 270.h,
      borderRadius: 12.r,
    );
  }
}

class AppointmentAvailableSlotsGridSliverShimmer extends StatelessWidget {
  const AppointmentAvailableSlotsGridSliverShimmer({
    super.key,
    this.itemCount = 12,
  });

  final int itemCount;

  int _buildCrossAxisCount(double width) {
    if (width > 1200) {
      return 7;
    } else if (width > 900) {
      return 6;
    } else if (width > 600) {
      return 5;
    } else {
      return 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _buildCrossAxisCount(context.screenWidth),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 76.w / 40.h,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) => const AppointmentSlotChipShimmer(),
    );
  }
}

class AppointmentSlotChipShimmer extends StatelessWidget {
  const AppointmentSlotChipShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.gray200,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}
