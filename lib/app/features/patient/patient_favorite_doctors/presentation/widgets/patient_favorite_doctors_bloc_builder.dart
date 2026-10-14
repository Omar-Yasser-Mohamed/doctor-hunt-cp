import 'package:doctor_hunt/app/core/utils/app_icons.dart';
import 'package:doctor_hunt/app/core/widgets/app_error_widget.dart';
import 'package:doctor_hunt/app/core/widgets/doctors_empty_state.dart';
import 'package:doctor_hunt/app/features/patient/patient_favorite_doctors/presentation/controller/patient_favorite_doctors_bloc/patient_favorite_doctors_bloc.dart';
import 'package:doctor_hunt/app/features/patient/patient_favorite_doctors/presentation/widgets/patient_favorite_doctors_grid_view.dart';
import 'package:doctor_hunt/app/features/patient/patient_favorite_doctors/presentation/widgets/patient_favorite_doctors_shimmer.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientFavoriteDoctorsBlocBuilder extends StatelessWidget {
  const PatientFavoriteDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientFavoriteDoctorsBloc, PatientFavoriteDoctorsState>(
      builder: (context, state) {
        if (state is GetMyFavoriteDoctorsSuccess ||
            state is ToggleDoctorInFavoritesFailure) {
          final bloc = context.read<PatientFavoriteDoctorsBloc>();
          if (bloc.doctors.isEmpty) {
            return Center(
              child: DoctorsEmptyState(
                iconSvg: AppIcons.medical,
                title: t.noDoctorsFound,
                description: t.noSearchResultsDescription,
              ),
            );
          }
          return PatientFavoriteDoctorsGridView(doctors: bloc.doctors);
        } else if (state is GetMyFavoriteDoctorsFailure) {
          return AppErrorWidget(
            failure: state.failure,
            onRetry: () {
              context.read<PatientFavoriteDoctorsBloc>().add(
                const GetMyFavoriteDoctorsEvent(),
              );
            },
          );
        }

        return const PatientFavoriteDoctorsGridShimmer();
      },
    );
  }
}
