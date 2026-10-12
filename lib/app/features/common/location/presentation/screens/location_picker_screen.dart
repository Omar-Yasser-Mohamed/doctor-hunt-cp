import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/utils/app_toasts.dart';
import 'package:doctor_hunt/app/features/common/location/presentation/controller/location_picker_bloc/location_picker_bloc.dart';
import 'package:doctor_hunt/app/features/common/location/presentation/widgets/location_picker_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationPickerScreen extends StatelessWidget {
  const LocationPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationPickerBloc, LocationPickerState>(
      listenWhen: (previous, current) =>
          current.failure != null && previous.failure != current.failure,
      listener: (context, state) {
        if (state.failure != null) {
          AppToasts.showError(context, state.failure!.message);
        }
      },
      child: const Scaffold(
        backgroundColor: AppColors.white,
        body: LocationPickerScreenBody(),
      ),
    );
  }
}
