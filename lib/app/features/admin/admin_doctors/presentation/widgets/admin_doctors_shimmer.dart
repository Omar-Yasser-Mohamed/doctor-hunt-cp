import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Full screen shimmer for the Admin Doctors screen.
/// Matches the layout of [AdminDoctorsAppBar], [AdminDoctorsHeader],
/// filters list, and doctor cards.
class AdminDoctorsScreenShimmer extends StatelessWidget {
  const AdminDoctorsScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      slivers: [
        _AdminDoctorsAppBarShimmer(),
        SliverToBoxAdapter(
          child: _AdminDoctorsHeaderShimmer(),
        ),
        SliverToBoxAdapter(
          child: _AdminDoctorsFiltersShimmer(),
        ),
        AdminDoctorsListSliverShimmer(),
      ],
    );
  }
}

/// Shimmer for the top app bar in Admin Doctors.
class _AdminDoctorsAppBarShimmer extends StatelessWidget {
  const _AdminDoctorsAppBarShimmer();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      titleSpacing: 20.w,
      title: AppShimmer(
        child: Container(
          width: 90.w,
          height: 22.h,
          decoration: BoxDecoration(
            color: AppColors.gray200,
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
      ),
      actions: [
        AppShimmer(
          child: Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(
              color: AppColors.gray200,
              shape: BoxShape.circle,
            ),
          ),
        ),
        10.width,
        AppShimmer(
          child: Container(
            width: 32.w,
            height: 32.w,
            decoration: const BoxDecoration(
              color: AppColors.gray200,
              shape: BoxShape.circle,
            ),
          ),
        ),
        (20.w).width,
      ],
    );
  }
}

/// Shimmer for stats cards and search bar header.
class _AdminDoctorsHeaderShimmer extends StatelessWidget {
  const _AdminDoctorsHeaderShimmer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          8.height,
          Row(
            children: [
              const Expanded(child: _StatsCardShimmer()),
              12.width,
              const Expanded(child: _StatsCardShimmer()),
            ],
          ),
          8.height,
          const _SearchBarShimmer(),
          14.height,
        ],
      ),
    );
  }
}

/// Shimmer card matching [_StatsCard].
class _StatsCardShimmer extends StatelessWidget {
  const _StatsCardShimmer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(16),
      ),
      child: AppShimmer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 72.w,
              height: 11.h,
              decoration: BoxDecoration(
                color: AppColors.gray200,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
            6.height,
            Container(
              width: 36.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: AppColors.gray200,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Shimmer matching [AdminDoctorsSearchBar].
class _SearchBarShimmer extends StatelessWidget {
  const _SearchBarShimmer();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: AppShimmer(
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: AppColors.gray200,
                shape: BoxShape.circle,
              ),
            ),
            12.width,
            Container(
              width: 110.w,
              height: 14.h,
              decoration: BoxDecoration(
                color: AppColors.gray200,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Shimmer matching [AdminDoctorsFiltersList].
class _AdminDoctorsFiltersShimmer extends StatelessWidget {
  const _AdminDoctorsFiltersShimmer();

  @override
  Widget build(BuildContext context) {
    final chipWidths = [60.w, 80.w, 96.w, 76.w, 88.w];

    return SizedBox(
      height: 28.h,
      child: ListView.separated(
        padding: EdgeInsetsDirectional.only(start: 20.w, end: 12.w),
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: chipWidths.length,
        separatorBuilder: (_, _) => 8.width,
        itemBuilder: (context, index) {
          return AppShimmer(
            child: Container(
              width: chipWidths[index],
              height: 28.h,
              decoration: BoxDecoration(
                color: AppColors.gray200,
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Sliver list of [AdminDoctorCardShimmer]s for list loading states.
class AdminDoctorsListSliverShimmer extends StatelessWidget {
  const AdminDoctorsListSliverShimmer({
    super.key,
    this.itemCount = 5,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        top: 22,
        left: 20.w,
        right: 20.w,
        bottom: 12,
      ),
      sliver: SliverList.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) => const AdminDoctorCardShimmer(),
      ),
    );
  }
}

/// Shimmer card matching [AdminDoctorCard].
/// Reusable for pagination loading and full list loading.
class AdminDoctorCardShimmer extends StatelessWidget {
  const AdminDoctorCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: AppShimmer(
        child: Row(
          children: [
            // Doctor Photo Skeleton
            Container(
              width: 52.w,
              height: 52.w,
              decoration: BoxDecoration(
                color: AppColors.gray200,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
            ),

            10.width,

            // Doctor Info Skeletons
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
                    width: 80.w,
                    height: 12.h,
                    decoration: BoxDecoration(
                      color: AppColors.gray200,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),

                  6.height,

                  Container(
                    width: 95.w,
                    height: 12.h,
                    decoration: BoxDecoration(
                      color: AppColors.gray200,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ],
              ),
            ),

            // Status Pill Skeleton
            Container(
              width: 52.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: AppColors.gray200,
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
