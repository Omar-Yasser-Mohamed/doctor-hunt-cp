import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/features/admin/admin_settings/presentation/widgets/admin_settings_logout_button.dart';
import 'package:doctor_hunt/app/features/admin/admin_settings/presentation/widgets/admin_settings_options_card.dart';
import 'package:doctor_hunt/app/features/admin/admin_settings/presentation/widgets/admin_settings_profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminSettingScreenBody extends StatelessWidget {
  const AdminSettingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AdminSettingsProfileCard(),

          24.height,

          const AdminSettingsOptionsCard(),

          32.height,

          const AdminSettingsLogoutButton(),
        ],
      ),
    );
  }
}
