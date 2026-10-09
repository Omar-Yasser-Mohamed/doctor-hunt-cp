import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A user-friendly empty-state widget shown when the search screen
/// is in its initial state, encouraging the user to start searching.
class FindDoctorsStartSearchWidget extends StatelessWidget {
  const FindDoctorsStartSearchWidget({
    super.key,
    required this.title,
    this.description,
    this.icon,
  });

  final String title;
  final String? description;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final effectiveIcon = icon ?? Icons.person_search_rounded;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryLight,
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.12),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              effectiveIcon,
              size: 40,
              color: AppColors.primary,
            ),
          ),

          20.height,

          Text(
            title,
            style: context.bold16TextMain,
            textAlign: TextAlign.center,
          ),

          if (description != null) ...[
            7.height,
            Text(
              description!,
              style: context.regular12TextPlaceholder,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
