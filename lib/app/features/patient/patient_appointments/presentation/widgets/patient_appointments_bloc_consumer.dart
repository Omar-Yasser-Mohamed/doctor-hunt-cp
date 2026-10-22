import 'package:doctor_hunt/app/core/utils/app_icons.dart';
import 'package:doctor_hunt/app/core/utils/app_toasts.dart';
import 'package:doctor_hunt/app/features/patient/patient_appointments/presentation/widgets/patient_appointments_shimmer.dart';
import 'package:doctor_hunt/app/core/widgets/app_error_widget.dart';
import 'package:doctor_hunt/app/core/widgets/doctors_empty_state.dart';
import 'package:doctor_hunt/app/features/patient/patient_appointments/presentation/controller/patient_appointments_bloc/patient_appointments_bloc.dart';
import 'package:doctor_hunt/app/features/patient/patient_appointments/presentation/widgets/patient_appointments_list_view.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PatientAppointmentsBlocConsumer extends StatelessWidget {
  const PatientAppointmentsBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientAppointmentsBloc, PatientAppointmentsState>(
      listener: (context, state) {
        if (state is PatientAppointmentsActionFailure) {
          AppToasts.showError(context, state.failure.message);
          context.pop();
        } else if (state is PatientAppointmentsCanceledSuccess) {
          AppToasts.showSuccess(context, t.appointmentCanceledSuccess);
          context.pop();
        } else if (state is GetPatientAppointmentsPaginationFailure) {
          AppToasts.showError(context, state.failure.message);
        }
      },
      builder: (context, state) {
        final bloc = context.read<PatientAppointmentsBloc>();
        if (state is GetPatientAppointmentsLoading ||
            state is PatientAppointmentsInitial) {
          return const PatientAppointmentsListSliverShimmer();
        } else if (state is GetPatientAppointmentsFailure) {
          return AppErrorSliver(
            failure: state.failure,
            onRetry: () {
              bloc.add(const GetPatientAppointmentsEvent());
            },
          );
        } else {
          if (bloc.appointments.isEmpty) {
            return SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: DoctorsEmptyState(
                  iconSvg: AppIcons.medical,
                  title: context.t.noAppointmentsYet,
                  description: context.t.youHaventBookedAnyAppointmentsYet,
                ),
              ),
            );
          }
          return PatientAppointmentsListView(appointments: bloc.appointments);
        }
      },
    );
  }
}
