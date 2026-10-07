import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/features/admin/admin_settings/presentation/widgets/admin_settings_option_tile.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminSettingsOptionsCard extends StatelessWidget {
  const AdminSettingsOptionsCard({super.key});

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Divider(
        height: 1,
        thickness: 1,
        color: AppColors.graySoft,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          AdminSettingsOptionTile(
            icon: Icons.manage_accounts_outlined,
            title: t.adminProfile,
            subtitle: t.adminProfileSubtitle,
            onTap: () {},
          ),

          _buildDivider(),

          AdminSettingsOptionTile(
            icon: Icons.lock_reset_rounded,
            title: t.changePassword,
            subtitle: t.changePasswordSubtitle,
            onTap: () {},
          ),

          _buildDivider(),

          AdminSettingsOptionTile(
            icon: Icons.info_outline_rounded,
            title: t.appInformation,
            subtitle: t.buildVersion,
            trailing: Text(
              'v1.0.0',
              style: context.regular12TextSub,
            ),
          ),
        ],
      ),
    );
  }
}
