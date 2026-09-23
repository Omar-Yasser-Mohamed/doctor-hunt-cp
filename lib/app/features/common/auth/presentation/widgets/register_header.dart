import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      child: Column(
        children: [
          Text(
            t.joinUsToStartSearching,
            style: context.semiBold24Black.copyWith(
              letterSpacing: -0.3,
            ),
          ),

          14.height,

          Text(
            t.youCanSearchCourseApplyCourseAndFindScholarshipForAbroadStudies,
            style: context.regular14TextSub,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
