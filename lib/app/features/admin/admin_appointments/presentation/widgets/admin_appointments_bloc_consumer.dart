import 'package:doctor_hunt/app/core/utils/app_icons.dart';
import 'package:doctor_hunt/app/core/utils/app_toasts.dart';
import 'package:doctor_hunt/app/core/widgets/app_error_widget.dart';
import 'package:doctor_hunt/app/core/widgets/doctors_empty_state.dart';
import 'package:doctor_hunt/app/features/admin/admin_appointments/presentation/controller/admin_appointments_bloc/admin_appointments_bloc.dart';
import 'package:doctor_hunt/app/features/admin/admin_appointments/presentation/widgets/admin_appointments_list_view.dart';
import 'package:doctor_hunt/app/features/admin/admin_appointments/presentation/widgets/admin_appointments_shimmer.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AdminAppointmentsBlocConsumer extends StatelessWidget {
  const AdminAppointmentsBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminAppointmentsBloc, AdminAppointmentsState>(
      listener: (context, state) {
        if (state is AdminAppointmentsActionFailure) {
          AppToasts.showError(context, state.failure.message);
          context.pop();
        } else if (state is AdminAppointmentsCanceledSuccess) {
          AppToasts.showSuccess(context, t.appointmentCanceledSuccess);
          context.pop();
        } else if (state is AdminAppointmentsCompletedSuccess) {
          AppToasts.showSuccess(context, t.appointmentCompletedSuccess);
          context.pop();
        } else if (state is GetAdminAppointmentsPaginationFailure) {
          AppToasts.showError(context, state.failure.message);
        }
      },
      builder: (context, state) {
        final bloc = context.read<AdminAppointmentsBloc>();
        if (state is GetAdminAppointmentsLoading ||
            state is AdminAppointmentsInitial) {
          return const AdminAppointmentsListSliverShimmer();
        } else if (state is GetAdminAppointmentsFailure) {
          return AppErrorSliver(
            failure: state.failure,
            onRetry: () {
              bloc.add(const GetAdminAppointmentsEvent());
            },
          );
        } else {
          if (bloc.appointments.isEmpty) {
            return SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: DoctorsEmptyState(
                  iconSvg: AppIcons.medical,
                  title: t.noAppointmentsFound,
                  description: t.noAppointmentsDescription,
                ),
              ),
            );
          }
          return AdminAppointmentsListView(appointments: bloc.appointments);
        }
      },
    );
  }
}
