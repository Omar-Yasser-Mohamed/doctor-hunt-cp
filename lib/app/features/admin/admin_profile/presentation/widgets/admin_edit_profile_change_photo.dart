import 'dart:io';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/string_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/custom_network_image.dart';
import 'package:doctor_hunt/app/core/widgets/image_source_bottom_sheet.dart';
import 'package:doctor_hunt/app/features/admin/admin_profile/presentation/controller/admin_edit_profile_bloc/admin_edit_profile_bloc.dart';
import 'package:doctor_hunt/app/features/common/user/presentation/controller/bloc/user_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AdminEditProfileChangePhoto extends StatelessWidget {
  const AdminEditProfileChangePhoto({super.key});

  Future<void> _onPhotoTap(BuildContext context) async {
    final ImageSource? source = await ImageSourceBottomSheet.show(context);
    if (source != null && context.mounted) {
      context.read<AdminEditProfileBloc>().add(
        AdminEditProfilePickImage(source),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminEditProfileBloc, AdminEditProfileState>(
      buildWhen: (previous, current) =>
          current is AdminEditProfileImagePicked ||
          current is AdminEditProfileInitial ||
          current is AdminEditProfileFormDirtyChanged ||
          current is AdminEditProfileSuccess,
      builder: (context, state) {
        final currentUser = context.read<UserBloc>().user;
        final bloc = context.read<AdminEditProfileBloc>();
        final File? pickedImage = bloc.pickedImage;
        final String? initialImageUrl =
            currentUser?.user.image ?? bloc.currentUser?.user.image;
        final String name = bloc.currentUser?.user.name ?? 'Admin';

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => _onPhotoTap(context),
              behavior: HitTestBehavior.opaque,
              child: Stack(
                children: [
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
                    child: ClipOval(
                      child: _buildAvatarContent(
                        context,
                        pickedImage: pickedImage,
                        initialImageUrl: initialImageUrl,
                        name: name,
                      ),
                    ),
                  ),

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
      },
    );
  }

  Widget _buildAvatarContent(
    BuildContext context, {
    required File? pickedImage,
    required String? initialImageUrl,
    required String name,
  }) {
    if (pickedImage != null) {
      return Image.file(
        pickedImage,
        width: 112.w,
        height: 112.w,
        fit: BoxFit.cover,
      );
    }
    if (initialImageUrl != null && initialImageUrl.isNotEmpty) {
      return CustomNetworkImage(
        imageUrl: initialImageUrl,
        width: 112.w,
        height: 112.w,
        radius: 9999,
      );
    }

    return Text(
      name.toAvatar,
      style: context.bold30Primary,
    );
  }
}
