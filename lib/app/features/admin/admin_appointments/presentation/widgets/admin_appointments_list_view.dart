import 'package:doctor_hunt/app/core/shared/models/appointment_model.dart';
import 'package:doctor_hunt/app/features/admin/admin_appointments/presentation/controller/admin_appointments_bloc/admin_appointments_bloc.dart';
import 'package:doctor_hunt/app/features/admin/admin_appointments/presentation/widgets/admin_appointment_card.dart';
import 'package:doctor_hunt/app/features/admin/admin_appointments/presentation/widgets/admin_appointments_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminAppointmentsListView extends StatelessWidget {
  const AdminAppointmentsListView({super.key, required this.appointments});
  final List<AppointmentModel> appointments;

  @override
  Widget build(BuildContext context) {
    final isLoadingMore = context.watch<AdminAppointmentsBloc>().state is GetAdminAppointmentsPaginationLoading;
    return SliverList.builder(
      itemCount: appointments.length + (isLoadingMore? 1 : 0),
      itemBuilder: (context, index) {
        if (isLoadingMore && index == appointments.length){
          return const AdminAppointmentCardShimmer();
        }
        return AdminAppointmentCard(appointment: appointments[index]);
      },
    );
  }
}