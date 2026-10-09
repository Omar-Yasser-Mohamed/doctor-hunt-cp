import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/utils/app_validators.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/core/widgets/app_text_field.dart';
import 'package:doctor_hunt/app/features/admin/admin_profile/presentation/widgets/admin_edit_profile_field_label.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminEditProfileForm extends StatefulWidget {
  const AdminEditProfileForm({super.key});

  @override
  State<AdminEditProfileForm> createState() => _AdminEditProfileFormState();
}

class _AdminEditProfileFormState extends State<AdminEditProfileForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _clinicLocationController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _clinicLocationController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _clinicLocationController.dispose();
    super.dispose();
  }

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      // Valid form - UI prototyping per Rule 8
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  OutlineInputBorder _buildInputBorder({
    Color borderColor = AppColors.textBorders,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: borderColor, width: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Full Name Field
              AdminEditProfileFieldLabel(label: t.fullName),

              8.height,

              AppTextField(
                controller: _nameController,
                hintText: t.fullName,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                filled: true,
                fillColor: AppColors.white,
                border: _buildInputBorder(),
                prefixIcon: const Icon(
                  Icons.person_outline_rounded,
                  color: AppColors.secondaryDark,
                  size: 24,
                ),
                textInputAction: TextInputAction.next,
                validator: AppValidators.name,
              ),

              16.height,

              // 2. Email Address Field (Disabled as requested)
              AdminEditProfileFieldLabel(label: t.emailAddress),

              8.height,

              AppTextField(
                controller: _emailController,
                hintText: t.emailAddress,
                enabled: false,
                textStyle: context.medium16TextSub,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                filled: true,
                fillColor: AppColors.border.withValues(alpha: 0.7),
                border: _buildInputBorder(
                  borderColor: AppColors.textBorders.withValues(
                    alpha: 0.8,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.mail_outline_rounded,
                  color: AppColors.secondaryLight,
                  size: 24,
                ),
              ),

              16.height,

              // 3. Clinic Location Field (With location leading icon)
              AdminEditProfileFieldLabel(label: t.clinicLocation),

              8.height,

              AppTextField(
                controller: _clinicLocationController,
                hintText: t.clinicLocation,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                filled: true,
                fillColor: AppColors.white,
                border: _buildInputBorder(),
                prefixIcon: const Icon(
                  Icons.location_on_outlined,
                  color: AppColors.secondaryDark,
                  size: 24,
                ),
                textInputAction: TextInputAction.done,
                validator: (value) => AppValidators.required(
                  value,
                  fieldName: t.clinicLocation,
                ),
              ),

              32.height,
            ],
          ),

          // Save Changes Button
          AppButton(
            text: t.saveChanges,
            radius: 16.r,
            height: 50.h,
            onPressed: _onSave,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check,
                  size: 22,
                  color: AppColors.white,
                ),

                6.width,

                Text(
                  t.saveChanges,
                  style: context.semiBold16White,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
