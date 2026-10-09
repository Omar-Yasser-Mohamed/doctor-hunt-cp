import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Full screen shimmer for the Patient Home screen.
/// Matches the layout of [PatientHomeScreenBody] with [_HomeHeaderShimmer],
/// [_CategoriesListShimmer], [_PopularDoctorsSectionShimmer], and [_TopRatedDoctorsSectionShimmer].
class PatientHomeScreenShimmer extends StatelessWidget {
  const PatientHomeScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsetsDirectional.only(bottom: 108.h),
      child: Column(
        children: [
          const _HomeHeaderShimmer(),

          12.height,

          SizedBox(
            height: 90.h,
            child: const _CategoriesListShimmer(),
          ),

          30.height,

          const _PopularDoctorsSectionShimmer(),

          30.height,

          const _TopRatedDoctorsSectionShimmer(),
        ],
      ),
    );
  }
}

/// Shimmer for the Home Header matching [HomeHeader].
class _HomeHeaderShimmer extends StatelessWidget {
  const _HomeHeaderShimmer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: context.topPadding + 16,
            left: 20.w,
            right: 20.w,
            bottom: 52.h,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: context.isArabic
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              end: context.isArabic
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              colors: const [
                AppColors.lighterGreen,
                AppColors.green,
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24.r),
              bottomRight: Radius.circular(24.r),
            ),
          ),
          child: AppShimmer(
            baseColor: AppColors.white.withValues(alpha: 0.25),
            highlightColor: AppColors.white.withValues(alpha: 0.55),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),

                      6.height,

                      Container(
                        width: 180.w,
                        height: 26.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ],
                  ),
                ),

                8.width,

                Container(
                  width: 60.r,
                  height: 60.r,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Search bar skeleton
        Transform.translate(
          offset: Offset(0, -28.h),
          child: Container(
            height: 54.h,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(6.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: .08),
                  blurRadius: 20,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: AppShimmer(
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: AppColors.gray200,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),

                  12.width,

                  Container(
                    width: 120.w,
                    height: 16.h,
                    decoration: BoxDecoration(
                      color: AppColors.gray200,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Shimmer list for categories matching [CategoriesListView].
class _CategoriesListShimmer extends StatelessWidget {
  const _CategoriesListShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      separatorBuilder: (context, index) => 12.width,
      itemBuilder: (context, index) => const _CategoryCardShimmer(),
    );
  }
}

/// Shimmer placeholder for a single category item card matching [CategoryCard].
class _CategoryCardShimmer extends StatelessWidget {
  const _CategoryCardShimmer();

  @override
  Widget build(BuildContext context) {
    return AppShimmerBox(
      width: 80.w,
      borderRadius: 8.r,
    );
  }
}

/// Shimmer placeholder for section headers matching [HomeSectionTitle].
class HomeSectionTitleShimmer extends StatelessWidget {
  const HomeSectionTitleShimmer({
    super.key,
    this.titleWidth = 140,
  });

  final double titleWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: AppShimmer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: titleWidth.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: AppColors.gray200,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 44.w,
                  height: 14.h,
                  decoration: BoxDecoration(
                    color: AppColors.gray200,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                4.width,
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: AppColors.gray200,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Shimmer section for popular doctors matching [PopularDoctorsSection].
class _PopularDoctorsSectionShimmer extends StatelessWidget {
  const _PopularDoctorsSectionShimmer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeSectionTitleShimmer(titleWidth: 140),

        22.height,

        SizedBox(
          height: 250.h,
          child: const _PopularDoctorsListShimmer(),
        ),
      ],
    );
  }
}

/// Shimmer list matching [PopularDoctorsListView].
class _PopularDoctorsListShimmer extends StatelessWidget {
  const _PopularDoctorsListShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      clipBehavior: Clip.none,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsetsDirectional.only(start: 20.w, end: 4.w),
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) => const PopularDoctorCardShimmer(),
    );
  }
}

/// Shimmer card matching [PopularDoctorCard].
/// Reusable for pagination loading and horizontal section loading.
class PopularDoctorCardShimmer extends StatelessWidget {
  const PopularDoctorCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190.w,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsetsDirectional.only(end: 16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.08),
            blurRadius: 40,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: AppShimmer(
        child: Column(
          children: [
            // Doctor Photo Skeleton
            Expanded(
              child: Container(
                width: double.infinity,
                color: AppColors.gray200,
              ),
            ),

            // Doctor Info Skeleton
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120.w,
                    height: 18.h,
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

                  8.height,

                  Container(
                    width: 100.w,
                    height: 16.h,
                    decoration: BoxDecoration(
                      color: AppColors.gray200,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Shimmer section for top rated doctors matching [TopRatedDoctorsSection].
class _TopRatedDoctorsSectionShimmer extends StatelessWidget {
  const _TopRatedDoctorsSectionShimmer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeSectionTitleShimmer(titleWidth: 150),

        22.height,

        SizedBox(
          height: 130.h,
          child: const _TopRatedDoctorsListShimmer(),
        ),
      ],
    );
  }
}

/// Shimmer list matching [TopRatedDoctorsListView].
class _TopRatedDoctorsListShimmer extends StatelessWidget {
  const _TopRatedDoctorsListShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      clipBehavior: Clip.none,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsetsDirectional.only(start: 20.w, end: 6.w),
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) => const TopRatedDoctorCardShimmer(),
    );
  }
}

/// Shimmer card matching [TopRatedDoctorCard].
/// Reusable for pagination loading and horizontal section loading.
class TopRatedDoctorCardShimmer extends StatelessWidget {
  const TopRatedDoctorCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96.w,
      padding: const EdgeInsets.all(9),
      margin: EdgeInsetsDirectional.only(end: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: .06),
            blurRadius: 20.r,
            offset: Offset(0, 1.h),
          ),
        ],
      ),
      child: AppShimmer(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Favorite Icon Skeleton
                Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: AppColors.gray200,
                    shape: BoxShape.circle,
                  ),
                ),

                // Rating Skeleton
                Container(
                  width: 30.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: AppColors.gray200,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ],
            ),

            8.height,

            // Avatar Skeleton
            Container(
              width: 54.w,
              height: 54.w,
              decoration: const BoxDecoration(
                color: AppColors.gray200,
                shape: BoxShape.circle,
              ),
            ),

            12.height,

            // Name Skeleton
            Container(
              width: 68.w,
              height: 12.h,
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
