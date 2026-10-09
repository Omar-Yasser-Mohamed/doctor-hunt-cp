import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/string_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/image_source_bottom_sheet.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminEditProfileChangePhoto extends StatelessWidget {
  const AdminEditProfileChangePhoto({
    super.key,
  });

  void _onPhotoTap(BuildContext context) {
    ImageSourceBottomSheet.show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => _onPhotoTap(context),
          behavior: HitTestBehavior.opaque,
          child: Stack(
            children: [
              // Avatar circle with double border/ring effect
              Container(
                width: 112.w,
                height: 112.w,
                decoration: BoxDecoration(
                  color: AppColors.successLight,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.borderGreenSoft,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.05),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                    const BoxShadow(
                      color: AppColors.white,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  'a'.toAvatar,
                  style: context.bold30Primary,
                ),
              ),
          
              // Camera edit badge at bottom right
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white,
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                  ),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),

        12.height,

        GestureDetector(
          onTap: () => _onPhotoTap(context),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.camera_alt_outlined,
                color: AppColors.primary,
                size: 14,
              ),

              6.width,

              Text(
                t.tapPhotoToChange,
                style: context.semiBold12Primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
