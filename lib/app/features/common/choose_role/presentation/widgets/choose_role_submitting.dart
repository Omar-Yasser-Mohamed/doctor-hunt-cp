import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/features/common/choose_role/presentation/controller/choose_role_bloc/choose_role_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseRoleSubmitting extends StatelessWidget {
  const ChooseRoleSubmitting({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: t.kContinue,
      onPressed: () {
        final role = context.read<ChooseRoleBloc>().state;
        LoginRoute($extra: role).push(context);
      },
    );
  }
}
