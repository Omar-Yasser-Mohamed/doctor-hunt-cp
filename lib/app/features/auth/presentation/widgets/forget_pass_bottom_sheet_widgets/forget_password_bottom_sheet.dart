import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/features/auth/presentation/widgets/forget_pass_bottom_sheet_widgets/forget_password_view.dart';
import 'package:doctor_hunt/app/features/auth/presentation/widgets/forget_pass_bottom_sheet_widgets/otp_verify_view.dart';
import 'package:doctor_hunt/app/features/auth/presentation/widgets/forget_pass_bottom_sheet_widgets/reset_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordBottomSheet extends StatefulWidget {
  const ForgetPasswordBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (_) => const ForgetPasswordBottomSheet(),
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

              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: switch (currentPage) {
                  0 => ForgetPasswordView(
                    key: const ValueKey('forget_password'),
                    onContinue: () {
                      setState(() {
                        currentPage = 1;
                      });
                    },
                  ),
                  1 => OtpVerifyView(
                    key: const ValueKey('otp_verify'),
                    onContinue: () {
                      setState(() {
                        currentPage = 2;
                      });
                    },
                  ),
                  2 => ResetPasswordView(
                    key: const ValueKey('reset_password'),
                    onSuccess: () {
                      context.pop();
                    },
                  ),
                  _ => const SizedBox(),
                },
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
