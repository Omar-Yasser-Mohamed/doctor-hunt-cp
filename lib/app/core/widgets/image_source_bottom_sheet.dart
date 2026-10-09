import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceBottomSheet extends StatelessWidget {
  const ImageSourceBottomSheet({super.key});

  static Future<ImageSource?> show(BuildContext context) async {
    return await showModalBottomSheet<ImageSource>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const ImageSourceBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 8.w,
        right: 8.w,
        bottom: context.bottomPadding + 8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 130,
            height: 5,
            margin: const EdgeInsets.only(top: 16, bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: AppColors.bottomSheetNotice,
            ),
          ),

          ListTile(
            leading: const Icon(
              Icons.photo_library,
              color: AppColors.primaryDark,
            ),
            title: Text(
              t.fromGallery,
              style: context.medium14TextMain,
            ),
            onTap: () => context.pop(ImageSource.gallery),
          ),

          ListTile(
            leading: const Icon(
              Icons.camera_alt_outlined,
              color: AppColors.primaryDark,
            ),
            title: Text(
              t.takeAPhoto,
              style: context.medium14TextMain,
            ),
            onTap: () => context.pop(ImageSource.camera),
          ),
        ],
      ),
    );
  }
}
