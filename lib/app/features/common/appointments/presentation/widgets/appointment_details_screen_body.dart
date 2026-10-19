import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/shared/enums/appointment_status.dart';
import 'package:doctor_hunt/app/core/shared/models/appointment_model.dart';
import 'package:doctor_hunt/app/features/common/appointments/presentation/widgets/appointment_details_actions.dart';
import 'package:doctor_hunt/app/features/common/appointments/presentation/widgets/appointment_doctor_card.dart';
import 'package:doctor_hunt/app/features/common/appointments/presentation/widgets/appointment_patient_card.dart';
import 'package:doctor_hunt/app/features/common/appointments/presentation/widgets/appointment_schedule_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentDetailsScreenBody extends StatelessWidget {
  const AppointmentDetailsScreenBody({
    super.key,
    required this.appointment,
  });

  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    final isUpcoming = appointment.status == AppointmentStatus.upcoming;

    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  8.height,

                  if (appointment.patient != null)
                    AppointmentPatientCard(patient: appointment.patient!),

                  16.height,

                  if (appointment.doctor != null)
                    AppointmentDoctorCard(doctor: appointment.doctor!),

                  16.height,

                  AppointmentScheduleCard(appointment: appointment),
                  24.height,
                ],
              ),

              if (isUpcoming) ...[
                Padding(
                  padding: EdgeInsets.only(
                    left: 4.w,
                    right: 4.w,
                    bottom: context.bottomPadding + 16,
                  ),
                  child: AppointmentDetailsActions(appointment: appointment),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
