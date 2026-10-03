import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/utils/app_icons.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NoDoctorsWidget extends StatelessWidget {
  const NoDoctorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 44.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.successLight,
                  border: Border.all(color: AppColors.borderGreenSoft),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.05),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: SvgPicture.asset(
                  AppIcons.medical,
                  width: 40.w,
                  height: 40.w,
                  colorFilter: const ColorFilter.mode(
                    AppColors.successSoft,
                    BlendMode.srcIn,
                  ),
                ),
              ),

              Positioned(
                bottom: -6,
                right: context.isArabic ? null : -6,
                left: context.isArabic ? -6 : null,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                    border: Border.all(color: AppColors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withValues(alpha: 0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.add_rounded,
                    size: 24,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),

          20.height,

          Text(
            t.noDoctorsFound,
            style: context.bold16TextMain,
            textAlign: TextAlign.center,
          ),

          7.height,

          Text(
            t.noDoctorsFoundDescription,
            style: context.regular12TextPlaceholder,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
