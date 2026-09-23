import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/utils/app_images.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorCard extends StatefulWidget {
  const DoctorCard({super.key});

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Container(
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
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  AppImages.doctorTest,
                  height: 86.h,
                  width: 88.w,
                  fit: BoxFit.cover,
                ),
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
                            "Dr. Shruti Kedia",
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

                    Text(
                      "Tooths Dentist",
                      style: context.regular.primary.copyWith(
                        fontSize: 13.sp,
                      ),
                    ),

                    2.height,

                    Text(
                      "7 ${t.yearsExperience}",
                      style: context.light12TextSub,
                    ),

                    8.height,

                    Row(
                      children: [
                        _buildRowItem(value: "87%"),

                        17.width,

                        _buildRowItem(
                          value: "69 ${t.patientStories}",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          14.height,

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.nextAvailable,
                      style: context.medium.primary.copyWith(
                        fontSize: 13.sp,
                      ),
                    ),

                    4.height,

                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "10:00",
                            style: context.medium12TextSub,
                          ),

                          TextSpan(
                            text: " AM ${t.tomorrow}",
                            style: context.light12TextSub,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              12.width,

              AppButton(
                text: t.bookNow,
                onPressed: () {},
                width: 112.w,
                height: 34.h,
                radius: 4,
                textStyle: context.medium12White,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRowItem({
    required String value,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
        ),
        4.width,
        Text(
          value,
          style: context.light11TextSub,
        ),
      ],
    );
  }
}
