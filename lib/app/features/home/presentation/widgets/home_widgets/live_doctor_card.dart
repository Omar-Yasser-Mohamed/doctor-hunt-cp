import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/utils/app_images.dart';
import 'package:doctor_hunt/generated/translations.g.dart' show t;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveDoctorCard extends StatelessWidget {
  const LiveDoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 116.w,
      margin: EdgeInsetsDirectional.only(end: 14.w),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
      ),

      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppImages.doctorTest, fit: BoxFit.cover),
          ),

          Positioned.fill(
            child: Container(
              color: Colors.black.withValues(alpha: 0.2),
            ),
          ),

          Positioned(
            top: 11,
            left: context.isArabic ? 11 : null,
            right: context.isArabic ? null : 11,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.red200,
                borderRadius: BorderRadius.circular(3.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 2.8.r,
                    backgroundColor: Colors.white,
                  ),

                  2.width,

                  Text(
                    t.common.live,
                    style: context.medium8White,
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.white,
              size: 38.r,
            ),
          ),
        ],
      ),
    );
  }
}
