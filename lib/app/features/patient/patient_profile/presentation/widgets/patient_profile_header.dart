import 'package:doctor_hunt/app/core/extensions/string_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/custom_network_image.dart';
import 'package:doctor_hunt/app/core/widgets/image_source_bottom_sheet.dart';
import 'package:doctor_hunt/app/features/common/user/presentation/controller/bloc/user_bloc.dart';
import 'package:doctor_hunt/app/features/patient/patient_profile/presentation/controller/patient_update_profile_bloc/patient_update_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientProfileHeader extends StatelessWidget {
  const PatientProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 12, bottom: 28),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
      ),
      child: Center(
        child: GestureDetector(
          onTap: () async {
            final imageSource = await ImageSourceBottomSheet.show(context);

            if (imageSource != null) {
              context.read<PatientUpdateProfileBloc>().add(
                UpdatePatientProfileChangeImage(source: imageSource),
              );
            }
          },
          behavior: HitTestBehavior.opaque,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              BlocBuilder<PatientUpdateProfileBloc, PatientUpdateProfileState>(
                builder: (context, state) {
                  final user = context.read<UserBloc>().user;
                  final currentUserImage = user?.user.image;
                  final bloc = context.read<PatientUpdateProfileBloc>();
                  final imageFile = bloc.pickedImage;
                  final String name = user?.user.name ?? 'Patient';

                  if (imageFile != null) {
                    return ClipOval(
                      child: Image.file(
                        imageFile,
                        width: 130.w,
                        height: 130.w,
                        fit: BoxFit.cover,
                      ),
                    );
                  }

                  if (currentUserImage != null && currentUserImage.isNotEmpty) {
                    return CustomNetworkImage(
                      imageUrl: currentUserImage,
                      width: 130.w,
                      height: 130.w,
                      radius: 9999,
                    );
                  }

                  return Container(
                    width: 130.w,
                    height: 130.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.successLight,
                      border: Border.all(
                        color: AppColors.borderGreenSoft,
                        width: 2,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.white,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: Text(
                      name.toAvatar,
                      style: context.bold30Primary,
                    ),
                  );
                },
              ),

              Positioned.directional(
                textDirection: Directionality.of(context),
                bottom: 12,
                end: -8,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withValues(alpha: .8),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withValues(alpha: 0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    size: 24,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
