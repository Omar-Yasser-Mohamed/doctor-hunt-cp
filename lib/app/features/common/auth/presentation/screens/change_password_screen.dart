import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/admin_scaffold.dart';
import 'package:doctor_hunt/app/core/widgets/app_back_button.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/change_password_screen_body.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const AppBackButton(),
        title: Text(
          t.changePassword,
          style: context.bold18TextMain,
        ),
      ),
      body: const ChangePasswordScreenBody(),
    );
  }
}