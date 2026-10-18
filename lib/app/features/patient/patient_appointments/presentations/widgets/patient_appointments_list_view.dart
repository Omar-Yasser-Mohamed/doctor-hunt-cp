import 'package:doctor_hunt/app/core/shared/models/appointment_model.dart';
import 'package:doctor_hunt/app/features/patient/patient_appointments/presentations/widgets/patient_appointments_shimmer.dart';
import 'package:doctor_hunt/app/features/patient/patient_appointments/presentations/controller/patient_appointments_bloc/patient_appointments_bloc.dart';
import 'package:doctor_hunt/app/features/patient/patient_appointments/presentations/widgets/patient_appointment_card.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientAppointmentsListView extends StatelessWidget {
  const PatientAppointmentsListView({super.key, required this.appointments});
  final List<AppointmentModel> appointments;

  @override
  Widget build(BuildContext context) {
    final isLoadingMore =
        context.watch<PatientAppointmentsBloc>().state
            is GetPatientAppointmentsPaginationLoading;
    return SliverList.builder(
      itemCount: appointments.length + (isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (isLoadingMore && index == appointments.length) {
          return const PatientAppointmentCardShimmer();
        }
        return PatientAppointmentCard(
          key: ValueKey(appointments[index].id),
          appointment: appointments[index],
        );
      },
    );
  }
}
