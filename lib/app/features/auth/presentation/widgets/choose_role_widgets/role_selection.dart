import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:doctor_hunt/app/features/auth/presentation/widgets/choose_role_widgets/role_card.dart';
import 'package:flutter/material.dart';

class RoleSelection extends StatefulWidget {
  const RoleSelection({super.key});

  @override
  State<RoleSelection> createState() => _RoleSelectionState();
}

class _RoleSelectionState extends State<RoleSelection> {
  UserRole selectedRole = UserRole.patient;

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
          isSelected: selectedRole == role,
          onTap: () {
            setState(() {
              selectedRole = role;
            });
          },
        );
      },
    );
  }
}