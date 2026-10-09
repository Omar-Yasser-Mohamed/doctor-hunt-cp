import 'package:doctor_hunt/app/core/utils/app_icons.dart';
import 'package:doctor_hunt/app/core/utils/app_toasts.dart';
import 'package:doctor_hunt/app/core/widgets/app_error_widget.dart';
import 'package:doctor_hunt/app/core/widgets/doctors_empty_state.dart';
import 'package:doctor_hunt/app/features/patient/patient_find_doctors/presentation/controller/find_doctors_bloc/find_doctors_bloc.dart';
import 'package:doctor_hunt/app/features/patient/patient_find_doctors/presentation/widgets/find_doctors_start_search_widget.dart';
import 'package:doctor_hunt/app/features/patient/patient_find_doctors/presentation/widgets/patient_find_doctors_list_view.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/shimmers/patient_doctors_list_shimmer.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientFindDoctorsBlocBuilder extends StatelessWidget {
  const PatientFindDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FindDoctorsBloc, FindDoctorsState>(
      listener: (context, state) {
        if (state is FindDoctorsFailure) {
          AppToasts.showError(context, state.failure.message);
        }
      },
      builder: (context, state) {
        final bloc = context.read<FindDoctorsBloc>();
        if (state is FindDoctorsInitial) {
          return FindDoctorsStartSearchWidget(
            title: t.startSearchTitle,
            description: t.startSearchDescription,
          );
        } else if (state is FindDoctorsSuccess ||
            state is FindDoctorsPaginationFailure ||
            state is FindDoctorsPaginationLoading) {
          if (bloc.doctors.isEmpty) {
              return DoctorsEmptyState(
                iconSvg: AppIcons.medical,
                title: t.noDoctorsFound,
                description: t.noSearchResultsDescription,
              );
            }
          return PatientFindDoctorsListView(doctors: bloc.doctors);
        } else if (state is FindDoctorsFailure) {
          return AppErrorWidget(
            failure: state.failure,
          );
        }

        return const PatientDoctorsListShimmer();
      },
    );
  }
}
