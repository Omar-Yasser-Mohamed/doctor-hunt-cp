import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/custom_network_image.dart';
import 'package:doctor_hunt/app/core/widgets/doctor_favorite_icon_button.dart';
import 'package:doctor_hunt/app/core/widgets/dynamic_rating_stars.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PatientDoctorDetailsRoute($extra: doctor.id).push(context);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                CustomNetworkImage(
                  imageUrl: doctor.photo!,
                  radius: 8,
                  width: 82.w,
                  height: 82.w,
                ),

                12.width,

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              doctor.name,
                              style: context.medium18TextMain,
                            ),
                          ),

                          DoctorFavoriteIconButton(
                            doctor: doctor,
                            iconSize: 24,
                          ),
                        ],
                      ),

                      Text(
                        "${t.Specialist} ${doctor.specialty.title}",
                        style: context.light14TextSub,
                      ),

                      8.height,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DynamicRatingStars(
                            rating: doctor.rating,
                            size: 20,
                          ),

                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: doctor.rating.toStringAsFixed(1),
                                  style: context.medium16TextMain,
                                ),
                                TextSpan(
                                  text:
                                      " (${doctor.reviewsCount} ${t.reviews})",
                                  style: context.regular12.copyWith(
                                    color: AppColors.textSub.withValues(
                                      alpha: .8,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
