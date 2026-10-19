import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/utils/app_toasts.dart';
import 'package:doctor_hunt/app/core/utils/app_validators.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/core/widgets/app_text_field.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/change_password_bloc/change_password_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController =
      TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      context.read<ChangePasswordBloc>().add(
        SubmitChangePasswordEvent(
          currentPassword: _currentPasswordController.text,
          newPassword: _newPasswordController.text,
        ),
      );
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  Widget _buildFieldLabel(String label) {
    return Text(
      label,
      style: context.medium14TextMain,
    );
  }

  Widget _buildPasswordSuffixIcon({
    required bool isObscured,
    required VoidCallback onTap,
  }) {
    return IconButton(
      icon: Icon(
        isObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
        color: AppColors.textSub,
        size: 20,
      ),
      onPressed: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Current Password
            _buildFieldLabel(t.currentPassword),
            8.height,
            AppTextField(
              controller: _currentPasswordController,
              hintText: t.currentPassword,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              obscureText: _obscureCurrentPassword,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              prefixIcon: const Icon(
                Icons.lock_outline_rounded,
                color: AppColors.textSub,
                size: 20,
              ),
              suffixIcon: _buildPasswordSuffixIcon(
                isObscured: _obscureCurrentPassword,
                onTap: () {
                  setState(() {
                    _obscureCurrentPassword = !_obscureCurrentPassword;
                  });
                },
              ),
              validator: (value) =>
                  AppValidators.required(value, fieldName: t.currentPassword),
            ),

            16.height,

            // 2. New Password
            _buildFieldLabel(t.newPassword),
            8.height,
            AppTextField(
              controller: _newPasswordController,
              hintText: t.newPassword,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              obscureText: _obscureNewPassword,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              prefixIcon: const Icon(
                Icons.lock_outline_rounded,
                color: AppColors.textSub,
                size: 20,
              ),
              suffixIcon: _buildPasswordSuffixIcon(
                isObscured: _obscureNewPassword,
                onTap: () {
                  setState(() {
                    _obscureNewPassword = !_obscureNewPassword;
                  });
                },
              ),
              validator: AppValidators.password,
            ),

            16.height,

            // 3. Confirm New Password
            _buildFieldLabel(t.confirmNewPassword),
            8.height,
            AppTextField(
              controller: _confirmPasswordController,
              hintText: t.confirmNewPassword,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              obscureText: _obscureConfirmPassword,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              prefixIcon: const Icon(
                Icons.lock_outline_rounded,
                color: AppColors.textSub,
                size: 20,
              ),
              suffixIcon: _buildPasswordSuffixIcon(
                isObscured: _obscureConfirmPassword,
                onTap: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
              validator: (value) => AppValidators.confirmPassword(
                value,
                _newPasswordController.text,
              ),
            ),

            32.height,

            // Change Password Button
            BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
              listener: (context, state) {
                if (state is ChangePasswordFailure) {
                  AppToasts.showError(context, state.failure.message);
                } else if (state is ChangePasswordSuccess) {
                  AppToasts.showSuccess(context, t.passwordChangedSuccessfully);
                  context.pop();
                }
              },
              builder: (context, state) {
                return AppButton(
                  text: t.changePassword,
                  isLoading: state is ChangePasswordLoading,
                  onPressed: _onSubmit,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
