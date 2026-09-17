import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoleCard extends StatelessWidget {
  const RoleCard({
    super.key,
    required this.role,
    required this.isSelected,
    required this.onTap,
  });
  final UserRole role;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: isSelected
                  ? AppColors.lightGreen.withValues(alpha: .3)
                  : AppColors.greenSoft,
              border: isSelected
                  ? Border.all(color: AppColors.greenDeep, width: 2)
                  : Border.all(color: AppColors.greenLighter),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.greenSoft
                        : AppColors.graySoft,
                    shape: BoxShape.circle,
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              blurRadius: 2,
                              color: AppColors.black.withValues(alpha: .05),
                              offset: const Offset(0, 1),
                            ),
                          ]
                        : null,
                  ),
                  child: Icon(
                    isSelected ? role.selectedIcon : role.unselectedIcon,
                    color: isSelected ? AppColors.greenDeep : AppColors.textSub,
                  ),
                ),

                16.width,

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        role.label(context),
                        style: context.semiBold20.copyWith(
                          color: AppColors.darkBlue,
                        ),
                      ),

                      4.height,

                      Text(
                        role.description(context),
                        style: context.regular14TextSub,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 16,
            right: context.isArabic ? null : 16,
            left: context.isArabic ? 16 : null,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isSelected
                  ? const Icon(
                      Icons.check_circle_rounded,
                      color: AppColors.greenDeep,
                      size: 28,
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
