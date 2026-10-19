import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/string_extentions.dart';
import 'package:doctor_hunt/app/core/shared/models/user_model.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/custom_network_image.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentPatientCard extends StatelessWidget {
  const AppointmentPatientCard({super.key, required this.patient});

  final UserModel patient;

  @override
  Widget build(BuildContext context) {
    final patientImage = patient.image?.trim() ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.patient,
          style: context.bold14TextMain,
        ),

        8.height,

        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              if (patientImage.isNotEmpty)
                CustomNetworkImage(
                  imageUrl: patientImage,
                  width: 64.w,
                  height: 64.w,
                  radius: 12.r,
                )
              else
                Container(
                  width: 64.w,
                  height: 64.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    patient.name.toAvatar,
                    style: context.bold20White,
                  ),
                ),
              12.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patient.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.semiBold16TextMain,
                    ),
                    2.height,
                    Row(
                      children: [
                        const Icon(
                          Icons.mail_outline_rounded,
                          size: 14,
                          color: AppColors.textSub,
                        ),
                        8.width,
                        Expanded(
                          child: Text(
                            patient.email,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.regular11TextSub,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
