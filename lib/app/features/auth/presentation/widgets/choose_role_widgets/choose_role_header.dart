import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/utils/app_images.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChooseRoleHeader extends StatelessWidget {
  const ChooseRoleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          AppImages.appLogo,
          width: 70.w,
          height: 70.h,
        ),

        12.height,

        Text(
          context.t.appName,
          style: context.bold24TextMain.copyWith(
            color: AppColors.textDark,
            letterSpacing: -0.3,
          ),
        ),

        50.height,

        Text(
          context.t.chooseRole.chooseYourRole,
          textAlign: TextAlign.center,
          style: context.regular28.copyWith(
            color: AppColors.darkBlue,
          ),
        ),

        8.height,

        Text(
          context.t.chooseRole.chooseYourRoleDescription,
          textAlign: TextAlign.center,
          style: context.regular14.copyWith(
            color: AppColors.deepBlue,
          ),
        ),
      ],
    );
  }
}