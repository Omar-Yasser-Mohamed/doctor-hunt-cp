import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/utils/app_toasts.dart';
import 'package:doctor_hunt/app/core/widgets/admin_scaffold.dart';
import 'package:doctor_hunt/app/features/admin/admin_profile/presentation/controller/admin_edit_profile_bloc/admin_edit_profile_bloc.dart';
import 'package:doctor_hunt/app/features/admin/admin_profile/presentation/widgets/admin_edit_profile_screen_body.dart';
import 'package:doctor_hunt/app/features/common/user/presentation/controller/bloc/user_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AdminEditProfileScreen extends StatelessWidget {
  const AdminEditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdminEditProfileBloc, AdminEditProfileState>(
      listener: (context, state) {
        if (state is AdminEditProfileFailure) {
          AppToasts.showError(context, state.failure.message);
        } else if (state is AdminEditProfileSuccess) {
          context.read<UserBloc>().add(UpdateUserEvent(state.user));
          AppToasts.showSuccess(context, t.profileUpdatedSuccessfully);
          context.pop();
        }
      },
      child: AdminScaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            t.editProfile,
            style: context.bold18TextMain,
          ),
        ),
        body: const AdminEditProfileScreenBody(),
      ),
    );
  }
}
