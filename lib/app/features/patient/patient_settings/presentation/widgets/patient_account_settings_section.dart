import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/features/patient/patient_settings/presentation/widgets/patient_settings_tile.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

class PatientAccountSettingsSection extends StatefulWidget {
  const PatientAccountSettingsSection({super.key});

  @override
  State<PatientAccountSettingsSection> createState() =>
      _PatientAccountSettingsSectionState();
}

class _PatientAccountSettingsSectionState
    extends State<PatientAccountSettingsSection> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.accountSettings,
          style: context.medium16TextSub,
        ),

        8.height,

        PatientSettingsTile(
          leadingIcon: Icons.lock_rounded,
          iconBackgroundColor: Colors.red,
          title: t.changePassword,
          onTap: () => const ChangePasswordRoute().push(context),
        ),

        PatientSettingsTile(
          leadingIcon: Icons.notifications_rounded,
          iconBackgroundColor: AppColors.green1,
          title: t.notifications,
          trailing: SizedBox(
            height: 24,
            width: 44,
            child: Switch(
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
              thumbColor: const WidgetStatePropertyAll(AppColors.white),
              activeTrackColor: AppColors.primary,
              inactiveTrackColor: AppColors.gray1,
              trackOutlineColor: WidgetStatePropertyAll(
                _notificationsEnabled ? AppColors.primary : AppColors.gray1,
              ),
              trackOutlineWidth: const WidgetStatePropertyAll(2),
              padding: EdgeInsets.zero,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ),

        PatientSettingsTile(
          leadingIcon: Icons.people_alt,
          iconBackgroundColor: AppColors.orange,
          title: t.privacyPolicy,
          showDivider: false,
          onTap: () {
            const PrivacyPolicyRoute().push(context);
          },
        ),
      ],
    );
  }
}
