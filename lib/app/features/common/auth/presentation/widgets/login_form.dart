import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/snake_bar_extentions.dart';
import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/utils/app_validators.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/core/widgets/app_text_field.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/login_bloc/login_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool obsecureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          AppTextField(
            controller: _emailController,
            hintText: 'doctor_hunt@email.com',
            validator: AppValidators.email,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            suffixIcon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.check,
                color: AppColors.textSub,
              ),
            ),
          ),

          18.height,

          AppTextField(
            controller: _passwordController,
            hintText: "••••••••",
            validator: AppValidators.password,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.visiblePassword,
            obscureText: obsecureText,
            suffixIcon: IconButton(
              icon: Icon(
                obsecureText ? Icons.visibility_off : Icons.visibility,
                color: AppColors.textSub,
              ),
              onPressed: () {
                setState(() {
                  obsecureText = !obsecureText;
                });
              },
            ),
          ),

          32.height,

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BlocConsumer<LoginBloc, LoginState>(
              listenWhen: (previous, current) =>
                  current is LoginSuccess || current is LoginFailure,
              listener: (context, state) {
                if (state is LoginSuccess) {
                  final userRole = state.user.userRole;
                  if (userRole == UserRole.patient) {
                    const PatientHomeRoute().go(context);
                  } else if (userRole == UserRole.admin) {
                    const AdminTestRoute().go(context);
                  }
                } else if (state is LoginFailure) {
                  context.showErrorSnakbar(message: state.failure.message);
                }
              },
              builder: (context, state) {
                return AppButton(
                  text: t.login,
                  isLoading: state is LoginLoading,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<LoginBloc>().add(
                        LoginSubmitted(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        ),
                      );
                    } else {
                      setState(() {
                        _autovalidateMode = AutovalidateMode.always;
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
