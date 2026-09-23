import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/snake_bar_extentions.dart';
import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/utils/app_validators.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/core/widgets/app_text_field.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/register_bloc/register_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  bool _isAgreed = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autoValidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            controller: _nameController,
            hintText: t.name,
            validator: AppValidators.name,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
          ),

          18.height,

          AppTextField(
            controller: _emailController,
            hintText: t.email,
            validator: AppValidators.email,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
          ),

          18.height,

          AppTextField(
            controller: _passwordController,
            hintText: t.password,
            validator: AppValidators.password,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.visiblePassword,
            obscureText: _obscurePassword,
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: AppColors.textSub,
              ),
              onPressed: _togglePasswordVisibility,
            ),
          ),

          14.height,

          TermsAgreeButton(
            isChecked: _isAgreed,
            onChanged: () {
              setState(() {
                _isAgreed = !_isAgreed;
              });
            },
          ),

          54.height,

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BlocConsumer<RegisterBloc, RegisterState>(
              listenWhen: (previous, current) =>
                  current is RegisterSuccess || current is RegisterFailure,
              listener: (context, state) {
                if (state is RegisterSuccess) {
                  // const PatientHomeRoute().go(context);
                  context.showSuccessSnakbar(message: "Registration Success");
                } else if (state is RegisterFailure) {
                  context.showErrorSnakbar(message: state.failure);
                }
              },
              builder: (context, state) {
                return AppButton(
                  text: t.signUp,
                  isLoading: state is RegisterLoading,
                  onPressed: !_isAgreed
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            final userRole = context.extra<UserRole>();
                            context.read<RegisterBloc>().add(
                              RegisterSubmitted(
                                name: _nameController.text.trim(),
                                userRole: userRole,
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                              ),
                            );
                          } else {
                            setState(() {
                              _autoValidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TermsAgreeButton extends StatelessWidget {
  const TermsAgreeButton({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });
  final bool isChecked;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: onChanged,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 16,
              width: 16,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isChecked
                    ? AppColors.primary.withValues(alpha: .5)
                    : AppColors.textSub.withValues(alpha: .5),
              ),
              child: isChecked
                  ? Container(
                      height: 12,
                      width: 12,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                    )
                  : null,
            ),

            12.width,

            Text(
              t.agreeToTerms,
              style: context.regular12TextSub,
            ),
          ],
        ),
      ),
    );
  }
}
