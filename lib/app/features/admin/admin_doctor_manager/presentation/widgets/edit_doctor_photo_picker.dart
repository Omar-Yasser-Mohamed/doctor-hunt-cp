import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/custom_network_image.dart';
import 'package:doctor_hunt/app/core/widgets/image_source_bottom_sheet.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/presentation/controller/doctor_management_bloc/doctor_management_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditDoctorPhotoPicker extends StatelessWidget {
  const EditDoctorPhotoPicker({super.key, required this.doctor});
  final DoctorModel doctor;

  void _onChangePhoto(BuildContext context) async {
    final result = await ImageSourceBottomSheet.show(context);
    if (result != null && context.mounted) {
      context.read<DoctorManagementBloc>().add(
        PickDoctorProfileImage(source: result),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => _onChangePhoto(context),
          behavior: HitTestBehavior.opaque,
          child: SizedBox(
            width: 112.w,
            height: 112.w,
            child: Stack(
              children: [
                BlocBuilder<DoctorManagementBloc, DoctorManagementState>(
                  builder: (context, state) {
                    final imageFile =
                        context.read<DoctorManagementBloc>().doctorImage;
                    if (imageFile != null) {
                      return ClipOval(
                        child: Image.file(
                          imageFile,
                          width: 112.w,
                          height: 112.w,
                          fit: BoxFit.cover,
                        ),
                      );
                    }
                    return CustomNetworkImage(
                      imageUrl: doctor.photo ?? '',
                      width: 112.w,
                      height: 112.w,
                      radius: 9999,
                    );
                  },
                ),

                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withValues(alpha: 0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      border: Border.all(
                        color: AppColors.white,
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.white,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        12.height,

        GestureDetector(
          onTap: () => _onChangePhoto(context),
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
