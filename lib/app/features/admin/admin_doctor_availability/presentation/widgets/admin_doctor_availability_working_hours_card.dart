import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/presentation/controller/doctor_availability_bloc/doctor_availability_bloc.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/presentation/widgets/admin_doctor_availability_slot_duration_field.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/presentation/widgets/admin_doctor_availability_time_picker_field.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDoctorAvailabilityWorkingHoursCard extends StatelessWidget {
  const AdminDoctorAvailabilityWorkingHoursCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Section Header
        Text(
          t.workingHours,
          style: context.bold14TextMain,
        ),

        8.height,

        // Hours Card
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Time Range Row
              Row(
                children: [
                  Expanded(
                    child:
                        BlocBuilder<
                          DoctorAvailabilityBloc,
                          DoctorAvailabilityState
                        >(
                          buildWhen: (prev, current) =>
                              prev.updatedAvailability!.startTime !=
                              current.updatedAvailability!.startTime,
                          builder: (context, state) {
                            return AdminDoctorAvailabilityTimePickerField(
                              label: t.startTime,
                              time: state.updatedAvailability!.startTime,
                              onTimeChanged: (newTime) {
                                context.read<DoctorAvailabilityBloc>().add(
                                  ChangeStartTimeEvent(newTime),
                                );
                              },
                            );
                          },
                        ),
                  ),

                  10.width,

                  Expanded(
                    child:
                        BlocBuilder<
                          DoctorAvailabilityBloc,
                          DoctorAvailabilityState
                        >(
                          buildWhen: (prev, current) =>
                              prev.updatedAvailability!.endTime !=
                              current.updatedAvailability!.endTime,
                          builder: (context, state) {
                            return AdminDoctorAvailabilityTimePickerField(
                              label: t.endTime,
                              time: state.updatedAvailability!.endTime,
                              onTimeChanged: (newTime) {
                                context.read<DoctorAvailabilityBloc>().add(
                                  ChangeEndTimeEvent(newTime),
                                );
                              },
                            );
                          },
                        ),
                  ),
                ],
              ),

              12.height,

              // Slot Duration
              const AdminDoctorAvailabilitySlotDurationField(),
            ],
          ),
        ),
      ],
    );
  }
}
