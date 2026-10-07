import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/shared/enums/week_day.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/presentation/controller/doctor_availability_bloc/doctor_availability_bloc.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/presentation/widgets/admin_doctor_availability_day_tile.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDoctorAvailabilityWorkingDaysCard extends StatelessWidget {
  const AdminDoctorAvailabilityWorkingDaysCard({super.key});

  static const List<WeekDay> _daysOrder = [
    WeekDay.monday,
    WeekDay.tuesday,
    WeekDay.wednesday,
    WeekDay.thursday,
    WeekDay.friday,
    WeekDay.saturday,
    WeekDay.sunday,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorAvailabilityBloc, DoctorAvailabilityState>(
      builder: (context, state) {
        final enabledCount = state.updatedAvailability!.workingDays.length;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Section Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t.workingDays,
                  style: context.bold14TextMain,
                ),
                Text(
                  t.daysEnabled(count: enabledCount),
                  style: context.regular11TextSub,
                ),
              ],
            ),

            8.height,

            // Days Card
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
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
              child: Column(
                children: List.generate(_daysOrder.length, (index) {
                  final day = _daysOrder[index];
                  final isLast = index == _daysOrder.length - 1;

                  return AdminDoctorAvailabilityDayTile(
                    day: day,
                    showDivider: !isLast,
                  );
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}
