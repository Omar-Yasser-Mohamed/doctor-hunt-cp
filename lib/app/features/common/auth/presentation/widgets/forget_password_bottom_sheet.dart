import 'package:doctor_hunt/app/core/di/injectable.dart';
import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/utils/app_toasts.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/forget_password_bloc/forget_password_bloc.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/forget_password_view.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/otp_verify_view.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/reset_password_view.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordBottomSheet extends StatefulWidget {
  const ForgetPasswordBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) => BlocProvider(
        create: (context) => getIt<ForgetPasswordBloc>(),
        child: const ForgetPasswordBottomSheet(),
      ),
    );
  }

  @override
  State<ForgetPasswordBottomSheet> createState() =>
      _ForgetPasswordBottomSheetState();
}

class _ForgetPasswordBottomSheetState extends State<ForgetPasswordBottomSheet> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            bottom:
                MediaQuery.viewInsetsOf(context).bottom +
                (context.bottomPadding + 24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _BottomSheetNotice(),

              BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
                listener: (context, state) {
                  if (state is ForgetPasswordSuccess) {
                    setState(() {
                      currentPage = 1;
                    });
                  } else if (state is VerifyOtpSuccess) {
                    setState(() {
                      currentPage = 2;
                    });
                  } else if (state is ResetPasswordSuccess) {
                    AppToasts.showSuccess(context, t.passwordResetSuccess);
                    context.pop();
                  } else if (state is ForgetPasswordFailure) {
                    AppToasts.showError(context, state.failure.message);
                  }
                },
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: switch (currentPage) {
                    0 => const ForgetPasswordView(
                      key: ValueKey('forget_password'),
                    ),
                    1 => const OtpVerifyView(key: ValueKey('otp_verify')),
                    2 => const ResetPasswordView(
                      key: ValueKey('reset_password'),
                    ),
                    _ => const SizedBox(),
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomSheetNotice extends StatelessWidget {
  const _BottomSheetNotice();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 130,
      margin: const EdgeInsets.only(top: 20, bottom: 54),
      decoration: BoxDecoration(
        color: const Color(0xffC4C4C4),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
