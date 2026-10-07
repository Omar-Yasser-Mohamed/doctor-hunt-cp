import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.notifications_none_rounded,
          color: AppColors.secondaryDark,
          size: 28,
        ),
      ),
    );
  }
}
