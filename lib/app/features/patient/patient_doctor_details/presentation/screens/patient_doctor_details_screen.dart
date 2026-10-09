import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/widgets/app_error_widget.dart';
import 'package:doctor_hunt/app/core/widgets/patient_scaffold.dart';
import 'package:doctor_hunt/app/features/patient/patient_doctor_details/presentation/controller/patient_doctor_details_bloc/patient_doctor_details_bloc.dart';
import 'package:doctor_hunt/app/features/patient/patient_doctor_details/presentation/widgets/patient_doctor_details_app_bar.dart';
import 'package:doctor_hunt/app/features/patient/patient_doctor_details/presentation/widgets/patient_doctor_details_screen_body.dart';
import 'package:doctor_hunt/app/features/patient/patient_doctor_details/presentation/widgets/patient_doctor_details_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientDoctorDetailsScreen extends StatelessWidget {
  const PatientDoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const PatientDoctorDetailsAppBar(),
      child: BlocBuilder<PatientDoctorDetailsBloc, PatientDoctorDetailsState>(
        builder: (context, state) {
          if (state is PatientDoctorDetailsSuccess) {
            return PatientDoctorDetailsScreenBody(doctor: state.doctor);
          } else if (state is PatientDoctorDetailsFailure) {
            return AppErrorWidget(
              failure: state.failure,
              onRetry: () {
                final doctorId = context.extra<String>();
                context.read<PatientDoctorDetailsBloc>().add(
                  GetPatientDoctorDetailsEvent(doctorId: doctorId),
                );
              },
            );
          }

          return const PatientDoctorDetailsShimmer();
        },
      ),
    );
  }
}
