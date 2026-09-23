import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/features/patient/appointment/presentation/widgets/appointment_times_list_view.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentTimeSection extends StatelessWidget {
  const AppointmentTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 20.w),
          child: Text(
            t.availableTime,
            style: context.medium16TextMain,
          ),
        ),

        24.height,

        SizedBox(
          height: 60.h,
          child: const AppointmentTimesListView(),
        ),
      ],
    );
  }
}
