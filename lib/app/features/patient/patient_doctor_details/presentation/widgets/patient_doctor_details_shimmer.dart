import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Full screen shimmer for Patient Doctor Details screen.
/// Matches the layout of [DoctorInfoCard], [ServicesSection],
/// and [DoctorLocationSection].
class PatientDoctorDetailsShimmer extends StatelessWidget {
  const PatientDoctorDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        top: 20,
        left: 20.w,
        right: 20.w,
        bottom: context.bottomPadding + 20,
      ),
      child: Column(
        children: [
          const _DoctorInfoCardShimmer(),
          32.height,
          const _ServicesSectionShimmer(),
          32.height,
          const _DoctorLocationSectionShimmer(),
        ],
      ),
    );
  }
}

class _DoctorInfoCardShimmer extends StatelessWidget {
  const _DoctorInfoCardShimmer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
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
            Row(
              children: [
                Container(
                  width: 88.w,
                  height: 86.h,
                  decoration: BoxDecoration(
                    color: AppColors.gray200,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                12.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 120.w,
                            height: 18.h,
                            decoration: BoxDecoration(
                              color: AppColors.gray200,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                          Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              color: AppColors.gray200,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                        ],
                      ),
                      4.height,
                      Container(
                        width: 100.w,
                        height: 14.h,
                        decoration: BoxDecoration(
                          color: AppColors.gray200,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      8.height,
                      Row(
                        children: [
                          Container(
                            width: 80.w,
                            height: 16.h,
                            decoration: BoxDecoration(
                              color: AppColors.gray200,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            width: 60.w,
                            height: 16.h,
                            decoration: BoxDecoration(
                              color: AppColors.gray200,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            15.height,
            Container(
              height: 32.h,
              width: 140.w,
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

class _ServicesSectionShimmer extends StatelessWidget {
  const _ServicesSectionShimmer();

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80.w,
            height: 18.h,
            decoration: BoxDecoration(
              color: AppColors.gray200,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          16.height,
          ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            separatorBuilder: (context, index) => Column(
              children: [
                14.height,
                Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.textSub.withValues(alpha: .1),
                ),
                17.height,
              ],
            ),
            itemBuilder: (context, index) {
              final widths = [0.85, 0.75, 0.65];
              return Row(
                children: [
                  Container(
                    width: 16.w,
                    height: 14.h,
                    decoration: BoxDecoration(
                      color: AppColors.gray200,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  8.width,
                  Expanded(
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: widths[index],
                      child: Container(
                        height: 14.h,
                        decoration: BoxDecoration(
                          color: AppColors.gray200,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _DoctorLocationSectionShimmer extends StatelessWidget {
  const _DoctorLocationSectionShimmer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.08),
            blurRadius: 30,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: AppShimmer(
        child: Container(
          width: double.infinity,
          height: 190.h,
          decoration: BoxDecoration(
            color: AppColors.gray200,
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    );
  }
}
