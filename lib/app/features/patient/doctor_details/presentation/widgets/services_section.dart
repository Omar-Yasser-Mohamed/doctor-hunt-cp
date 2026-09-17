import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(t.doctorDetails.services, style: context.medium18TextMain),

        16.height,
        const ServicesList(),
      ],
    );
  }
}

class ServicesList extends StatelessWidget {
  const ServicesList({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      "Patient care should be the number one priority.",
      "If you run your practiceyou know how frustrating.",
      "That’s why some of appointment reminder system.",
    ];

    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          14.height,

          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.textSub.withValues(alpha: .1),
          ),

          17.height,
        ],
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        return Text.rich(
          textAlign: TextAlign.left,
          TextSpan(
            children: [
              TextSpan(
                text: "${index + 1}.   ",
                style: context.medium14Primary.copyWith(
                  fontSize: 13.sp,
                ),
              ),
              TextSpan(
                text: services[index],
                style: context.light14TextSub.copyWith(
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
