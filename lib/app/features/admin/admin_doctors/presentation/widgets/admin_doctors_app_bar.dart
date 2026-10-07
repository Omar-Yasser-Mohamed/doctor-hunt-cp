import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/notification_button.dart';
import 'package:doctor_hunt/app/core/widgets/profile_image.dart';
import 'package:doctor_hunt/app/features/common/user/presentation/controller/bloc/user_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDoctorsAppBar extends StatelessWidget {
  const AdminDoctorsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      titleSpacing: 20.w,
      title: Text(
        t.doctors,
        style: context.bold18TextMain,
      ),
      actions: [
        const NotificationButton(),

        10.width,

        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserSuccess) {
              return ProfileImage(
                size: 32.w,
                name: state.user.user.name,
                imageUrl: state.user.user.image,
              );
            }
            return const SizedBox.shrink();
          },
        ),

        (20.w).width,
      ],
    );
  }
}
