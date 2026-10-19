import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/shared/enums/appointment_status.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentStatusBadge extends StatelessWidget {
  const AppointmentStatusBadge({super.key, required this.status});
  final AppointmentStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: status.backgroundColor,
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 3,
            backgroundColor: status.color,
          ),

          5.width,

          Text(
            status.title,
            style: context.medium11.copyWith(
              fontSize: 10.sp,
              color: status.color,
            ),
          ),
        ],
      ),
    );
  }
}
