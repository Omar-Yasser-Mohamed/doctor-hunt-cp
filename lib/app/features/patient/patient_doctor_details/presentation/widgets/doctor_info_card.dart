import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/core/widgets/custom_network_image.dart';
import 'package:doctor_hunt/app/core/widgets/dynamic_rating_stars.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorInfoCard extends StatefulWidget {
  const DoctorInfoCard({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  State<DoctorInfoCard> createState() => _DoctorInfoCardState();
}

class _DoctorInfoCardState extends State<DoctorInfoCard> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
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
              if (widget.doctor.photo != null)
                CustomNetworkImage(
                  imageUrl: widget.doctor.photo!,
                  height: 86.h,
                  width: 88.w,
                  radius: 8.r,
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
                            widget.doctor.name,
                            style: context.medium18TextMain,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFav = !isFav;
                            });
                          },
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            child: Icon(
                              key: ValueKey(isFav),
                              isFav ? Icons.favorite : Icons.favorite_border,
                              color: isFav
                                  ? Colors.red
                                  : AppColors.unselectedIcon,
                            ),
                          ),
                        ),
                      ],
                    ),

                    4.height,

                    Text(
                      "${t.Specialist} ${widget.doctor.specialty.title}",
                      style: context.light14TextSub,
                    ),

                    8.height,

                    Row(
                      children: [
                        DynamicRatingStars(
                          rating: widget.doctor.rating,
                          size: 20,
                        ),

                        4.width,

                        Expanded(
                          child: Text.rich(
                            textAlign: TextAlign.end,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "\$ ",
                                  style: context.medium16Primary,
                                ),
                                TextSpan(
                                  text: "${widget.doctor.fees}/ ${t.hour}",
                                  style: context.light16TextSub,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          15.height,

          AppButton(
            text: t.bookNow,
            radius: 4.r,
            height: 32.h,
            width: 140.w,
            textStyle: context.medium14White,
            onPressed: () {
              const PatientAppointmentRoute().push(context);
            },
          ),
        ],
      ),
    );
  }
}
