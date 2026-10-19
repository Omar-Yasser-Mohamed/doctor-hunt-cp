import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarkAsCompletedButton extends StatelessWidget {
  const MarkAsCompletedButton({
    super.key,
    this.showIcon = false,
  });

  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      height: 36.h,
      radius: 6.r,
      text: t.markAsCompleted,
      textStyle: context.medium11White,
      backgroundColor: AppColors.primary,
      padding: EdgeInsets.zero,
      onPressed: () {},
      child: showIcon
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_rounded,
                  size: 16,
                  color: AppColors.white,
                ),
                6.width,
                Text(
                  t.markAsCompleted,
                  style: context.medium11White,
                ),
              ],
            )
          : null,
    );
  }
}
