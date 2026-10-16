import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_language_bottom_sheet.dart';
import 'package:doctor_hunt/app/features/patient/patient_settings/presentation/widgets/patient_settings_tile.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

class PatientMoreOptionsSection extends StatelessWidget {
  const PatientMoreOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.moreOptions,
          style: context.medium16TextSub,
        ),

        8.height,

        PatientSettingsTile(
          title: t.languages,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.isArabic ? 'العربية' : 'English',
                style: context.light12TextSub,
              ),
              4.width,
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.textSub,
                size: 20,
              ),
            ],
          ),
          onTap: () => AppLanguageBottomSheet.show(context),
        ),

        PatientSettingsTile(
          title: t.buildVersion,
          trailing: Text(
            'v1.0.0',
            style: context.light12TextSub,
          ),
          showDivider: false,
        ),
      ],
    );
  }
}

