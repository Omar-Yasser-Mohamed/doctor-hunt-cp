import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_back_button.dart';
import 'package:doctor_hunt/app/core/widgets/app_error_widget.dart';
import 'package:doctor_hunt/app/core/widgets/patient_scaffold.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/presentation/controller/patient_booking_bloc/patient_booking_bloc.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/presentation/widgets/patient_booking_appointment_screen_body.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/presentation/widgets/patient_booking_appointment_shimmer.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientBookingAppointmentScreen extends StatelessWidget {
  const PatientBookingAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(
          t.appointment,
          style: context.medium18TextMain,
        ),
      ),
      child: BlocBuilder<PatientBookingBloc, PatientBookingState>(
        builder: (context, state) {
          if (state is GetBookingDataLoading ||
              state is PatientBookingInitial) {
            return const PatientBookingAppointmentScreenShimmer();
          } else if (state is GetBookingDataFailure) {
            return AppErrorWidget(
              failure: state.failure,
              onRetry: () {
                final doctor = context.extra<DoctorModel>();
                context.read<PatientBookingBloc>().add(
                  GetDoctorAvailabilityAndAppointments(doctorId: doctor.id),
                );
              },
            );
          }
          return const PatientBookingAppointmentScreenBody();
        },
      ),
    );
  }
}
