import 'package:doctor_hunt/app/core/widgets/admin_scaffold.dart';
import 'package:doctor_hunt/app/core/widgets/app_error_widget.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/controller/admin_doctors_bloc/admin_doctors_bloc.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/widgets/admin_doctors_screen_body.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/widgets/admin_doctors_shimmer.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/widgets/floating_add_doctor_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminDoctorsScreen extends StatelessWidget {
  const AdminDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminDoctorsBloc, AdminDoctorsState>(
      builder: (context, state) {
        final isSuccess =
            state is AdminDoctorsSuccess ||
            state is AdminDoctorsListLoading ||
            state is AdminDoctorsPaginationFailure ||
            state is AdminDoctorsPaginationLoading;

        final isFailure = state is AdminDoctorsFailure;

        final bloc = context.read<AdminDoctorsBloc>();

        return AdminScaffold(
          body: isSuccess
              ? AdminDoctorsScreenBody(
                  doctorsStats: bloc.stats,
                  doctors: bloc.doctors,
                  specialtyCounts: bloc.specialtyCounts,
                )
              : isFailure
              ? AppErrorWidget.fromFailure(
                  failure: state.failure,
                  onRetry: () => bloc.add(const LoadAdminDoctorsEvent()),
                )
              : const AdminDoctorsScreenShimmer(),
          floatingActionButton: isSuccess
              ? const FloatingAddDoctorBotton()
              : null,
        );
      },
    );
  }
}
