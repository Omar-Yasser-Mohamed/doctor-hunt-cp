import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/utils/app_images.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeatureDoctorsListView extends StatelessWidget {
  const FeatureDoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      clipBehavior: Clip.none,
      padding: EdgeInsetsDirectional.only(start: 20.w, end: 6.w),
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const FeatureDoctorCard();
      },
    );
  }
}

class FeatureDoctorCard extends StatefulWidget {
  const FeatureDoctorCard({super.key});

  @override
  State<FeatureDoctorCard> createState() => _FeatureDoctorCardState();
}

class _FeatureDoctorCardState extends State<FeatureDoctorCard> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96.w,
      padding: const EdgeInsets.all(8),
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFav = !isFav;
                  });
                },
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    key: ValueKey(isFav),
                    isFav ? Icons.favorite : Icons.favorite_border,
                    color: isFav ? Colors.red : AppColors.unselectedIcon,
                    size: 16,
                  ),
                ),
              ),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.star,
                    color: AppColors.yellow,
                    size: 16,
                  ),

                  3.width,

                  Text(
                    "4.8",
                    style: context.medium11Black.copyWith(
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),

          8.height,

          ClipOval(
            child: Image.asset(
              AppImages.doctorTest,
              width: 54.w,
              height: 54.h,
              fit: BoxFit.cover,
            ),
          ),

          8.height,

          Text(
            "Dr. Crick",
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.medium12TextMain,
          ),

          2.height,

          Text.rich(
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            TextSpan(
              children: [
                TextSpan(
                  text: "\$ ",
                  style: context.light11TextSub.copyWith(
                    fontSize: 10.sp,
                    color: AppColors.lighterGreen,
                  ),
                ),
                TextSpan(
                  text: "25,00/ ${t.common.hour}",
                  style: context.light11TextSub.copyWith(
                    fontSize: 10.sp,
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
