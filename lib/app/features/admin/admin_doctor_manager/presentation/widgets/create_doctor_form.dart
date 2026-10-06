import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/utils/app_toasts.dart';
import 'package:doctor_hunt/app/core/utils/app_validators.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/core/widgets/app_text_field.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/presentation/controller/doctor_management_bloc/doctor_management_bloc.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/presentation/widgets/create_doctor_field_label.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/presentation/widgets/create_doctor_specialty_field.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CreateDoctorForm extends StatefulWidget {
  const CreateDoctorForm({super.key});

  @override
  State<CreateDoctorForm> createState() => _CreateDoctorFormState();
}

class _CreateDoctorFormState extends State<CreateDoctorForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _feeController = TextEditingController();
  final TextEditingController _specialtyController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _feeController.dispose();
    _specialtyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CreateDoctorFieldLabel(
            label: t.doctorName,
          ),

          8.height,

          AppTextField(
            controller: _nameController,
            hintText: t.doctorNameHint,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            textInputAction: TextInputAction.next,
            validator: (value) => AppValidators.required(
              value,
              fieldName: t.doctorName,
            ),
          ),

          16.height,

          CreateDoctorFieldLabel(
            label: t.specialty,
          ),

          8.height,

          CreateDoctorSpecialtyField(controller: _specialtyController),

          16.height,

          CreateDoctorFieldLabel(
            label: t.consultationFee,
          ),

          8.height,

          AppTextField(
            controller: _feeController,
            hintText: t.consultationFeeHint,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textInputAction: TextInputAction.done,
            validator: (value) => AppValidators.positiveNumber(
              value,
              fieldName: t.consultationFee,
            ),
          ),

          24.height,

          BlocConsumer<DoctorManagementBloc, DoctorManagementState>(
            listener: (context, state) {
              if (state is DoctorManagementSuccess) {
                AppToasts.showSuccess(context, t.doctorCreatedSuccessfully);
                context.pop();
              } else if (state is DoctorManagementFailure) {
                AppToasts.showError(context, state.failure.message);
              } else if (state is DoctorManagementImageNotPicked) {
                AppToasts.showWarning(context, t.pleaseSelectDoctorImage);
              }
            },
            builder: (context, state) {
              return AppButton(
                isLoading: state is DoctorManagementLoading,
                height: 52.h,
                text: t.createDoctor,
                textStyle: context.semiBold16White,
                onPressed: _submit,
              );
            },
          ),
        ],
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<DoctorManagementBloc>().add(
        CreateDoctor(
          name: _nameController.text.trim(),
          fees: double.parse(_feeController.text.trim()),
        ),
      );
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
