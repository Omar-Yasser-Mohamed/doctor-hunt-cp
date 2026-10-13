import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class PatientSettingsTile extends StatelessWidget {
  const PatientSettingsTile({
    super.key,
    this.leadingIcon,
    required this.title,
    this.trailing,
    this.onTap,
    this.showDivider = true,
    this.iconBackgroundColor,
  });

  final IconData? leadingIcon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool showDivider;
  final Color? iconBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.translucent,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                if (leadingIcon != null) ...[
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: iconBackgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      leadingIcon,
                      color: AppColors.white,
                      size: 24,
                    ),
                  ),
                  20.width,
                ],

                Expanded(
                  child: Text(
                    title,
                    style: context.light16TextSub,
                  ),
                ),

                trailing ??
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.textSub,
                      size: 18,
                    ),
              ],
            ),
          ),
        ),

        if (showDivider)
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.primary.withValues(alpha: 0.06),
          ),
      ],
    );
  }
}
