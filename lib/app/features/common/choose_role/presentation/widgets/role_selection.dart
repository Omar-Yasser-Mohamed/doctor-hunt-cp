import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:doctor_hunt/app/features/common/choose_role/presentation/widgets/role_card.dart';
import 'package:flutter/material.dart';

class RoleSelection extends StatelessWidget {
  const RoleSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: UserRole.values.length,
      separatorBuilder: (context, index) => 16.height,
      itemBuilder: (context, index) {
        final role = UserRole.values[index];
        return RoleCard(
          role: role,
        );
      },
    );
  }
}