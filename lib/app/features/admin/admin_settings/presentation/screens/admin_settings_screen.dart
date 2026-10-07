import 'package:doctor_hunt/app/core/widgets/admin_scaffold.dart';
import 'package:doctor_hunt/app/features/admin/admin_settings/presentation/widgets/admin_setting_screen_body.dart';
import 'package:doctor_hunt/app/features/admin/admin_settings/presentation/widgets/admin_settings_app_bar.dart';
import 'package:flutter/material.dart';

class AdminSettingsScreen extends StatelessWidget {
  const AdminSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminScaffold(
      appBar: AdminSettingsAppBar(),
      body: AdminSettingScreenBody(),
    );
  }
}