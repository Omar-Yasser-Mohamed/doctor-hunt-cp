import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/utils/app_toasts.dart';
import 'package:doctor_hunt/app/core/utils/app_validators.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/features/common/user/presentation/controller/bloc/user_bloc.dart';
import 'package:doctor_hunt/app/features/patient/patient_profile/presentation/controller/patient_update_profile_bloc/patient_update_profile_bloc.dart';
import 'package:doctor_hunt/app/features/patient/patient_profile/presentation/widgets/patient_profile_text_field.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PatientProfileForm extends StatefulWidget {
  const PatientProfileForm({super.key});

  @override
  State<PatientProfileForm> createState() => _PatientProfileFormState();
}

class _PatientProfileFormState extends State<PatientProfileForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    final user = context.read<UserBloc>().user;
    _nameController = TextEditingController(text: user?.user.name);
    _emailController = TextEditingController(text: user?.user.email);

    _nameController.addListener(_listenToFormChanges);
  }

  void _listenToFormChanges() {
    context.read<PatientUpdateProfileBloc>().add(
      UpdatePatientProfileNameChanged(_nameController.text),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _onContinue() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<PatientUpdateProfileBloc>().add(
        UpdatePatientProfileEvent(name: _nameController.text),
      );
    } else {
      setState(() {
        _autoValidateMode = AutovalidateMode.onUserInteraction;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 24,
        bottom: context.bottomPadding + 24,
      ),
      child: Form(
        key: _formKey,
        autovalidateMode: _autoValidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              t.personalInformation,
              style: context.medium18TextMain,
            ),

            18.height,

            PatientProfileTextField(
              label: t.name,
              controller: _nameController,
              validator: AppValidators.name,
              suffixIcon: const Icon(
                Icons.edit_outlined,
                size: 22,
                color: AppColors.textPlaceholder,
              ),
            ),

            16.height,

            PatientProfileTextField(
              label: t.email,
              controller: _emailController,
              enabled: false,
              suffixIcon: const Icon(
                Icons.lock_outline,
                size: 22,
                color: AppColors.textPlaceholder,
              ),
            ),

            const Spacer(),

            BlocConsumer<PatientUpdateProfileBloc, PatientUpdateProfileState>(
              listener: (context, state) {
                if (state is PatientUpdateProfileSuccess) {
                  context.read<UserBloc>().add(
                    UpdateUserEvent(state.currentUserModel),
                  );
                  AppToasts.showSuccess(context, t.profileUpdatedSuccessfully);
                  context.pop();
                } else if (state is PatientUpdateProfileFailure) {
                  AppToasts.showError(context, state.failure.message);
                }
              },
              builder: (context, state) {
                final isFormDirty = context
                    .read<PatientUpdateProfileBloc>()
                    .isFormDirty;
                return AppButton(
                  text: t.continueButton,
                  isLoading: state is PatientUpdateProfileLoading,
                  isDisabled: !isFormDirty,
                  onPressed: _onContinue,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
