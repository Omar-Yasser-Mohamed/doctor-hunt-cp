import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/features/common/location/presentation/controller/location_picker_bloc/location_picker_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LocationConfirmButton extends StatelessWidget {
  const LocationConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationPickerBloc, LocationPickerState>(
      buildWhen: (previous, current) =>
          previous.canConfirm != current.canConfirm ||
          previous.locationModel != current.locationModel,
      builder: (context, state) {
        return AppButton(
          text: t.confirmLocation,
          isDisabled: !state.canConfirm,
          onPressed: () {
            if (state.locationModel != null) {
              context.pop(state.locationModel);
            }
          },
        );
      },
    );
  }
}
