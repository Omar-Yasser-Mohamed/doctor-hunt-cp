import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/utils/app_images.dart';
import 'package:doctor_hunt/app/core/widgets/app_text_field.dart';
import 'package:doctor_hunt/generated/translations.g.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

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
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.home.hi(name: "Omar"),
                      style: context.light20White,
                    ),

                    2.height,

                    Text(
                      t.home.findYourDoctor,
                      style: context.bold24White,
                    ),
                  ],
                ),
              ),
              8.width,
              ClipOval(
                child: Image.asset(
                  AppImages.profileTest,
                  width: 60.w,
                  height: 60.h,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),

        const _HomeSearchButton(),
      ],
    );
  }
}

class _HomeSearchButton extends StatelessWidget {
  const _HomeSearchButton();

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -28.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: .08),
              blurRadius: 20,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: AppTextField(
          hintText: t.home.search,
          readOnly: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: BorderSide.none,
          ),
          suffixIcon: const Icon(
            Icons.close,
            color: AppColors.textSub,
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: AppColors.textSub,
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
