import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/shared/enums/week_day.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/presentation/controller/doctor_availability_bloc/doctor_availability_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminDoctorAvailabilityDayTile extends StatelessWidget {
  const AdminDoctorAvailabilityDayTile({
    super.key,
    required this.day,
    this.showDivider = true,
  });

  final WeekDay day;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DoctorAvailabilityBloc, DoctorAvailabilityState, bool>(
      selector: (state) {
        return state.updatedAvailability!.workingDays.contains(day);
      },
      builder: (context, isSelected) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icon + Day Label
                  Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primaryLight
                              : AppColors.adminBackground,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.calendar_month_outlined,
                            size: 18,
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.textSub,
                          ),
                        ),
                      ),

                      10.width,

                      Text(
                        day.title,
                        style: context.medium14.copyWith(
                          color: isSelected
                              ? AppColors.textMain
                              : AppColors.textSub,
                        ),
                      ),
                    ],
                  ),

                  // Toggle Switch matching Figma
                  Transform.scale(
                    scale: 0.78,
                    child: CupertinoSwitch(
                      value: isSelected,
                      activeTrackColor: AppColors.primary,
                      inactiveTrackColor: AppColors.border,
                      thumbColor: AppColors.white,
                      onChanged: (_) {
                        context.read<DoctorAvailabilityBloc>().add(
                          ToggleWorkingDayEvent(day),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            if (showDivider)
              const Divider(
                height: 1,
                thickness: 1,
                color: AppColors.border,
              ),
          ],
        );
      },
    );
  }
}
