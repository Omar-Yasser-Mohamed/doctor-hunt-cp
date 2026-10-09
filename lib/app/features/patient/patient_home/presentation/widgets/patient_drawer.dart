import 'package:doctor_hunt/app/core/di/injectable.dart';
import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/utils/app_icons.dart';
import 'package:doctor_hunt/app/core/widgets/logout_dialog.dart';
import 'package:doctor_hunt/app/core/widgets/patient_nav_bar.dart';
import 'package:doctor_hunt/app/core/widgets/profile_image.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/logout_bloc/logout_bloc.dart';
import 'package:doctor_hunt/app/features/common/user/presentation/controller/bloc/user_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PatientDrawer extends StatelessWidget {
  const PatientDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LogoutBloc>(),
      child: Padding(
        padding: EdgeInsets.only(
          top: context.topPadding + 16,
          right: 20.w,
          left: 20.w,
          bottom: context.bottomPadding + 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _PatientDrawerHeader(),

            72.height,

            const _DrawerNavigationSection(),

            const Spacer(),

            const _LogoutButton(),
          ],
        ),
      ),
    );
  }
}

class _PatientDrawerHeader extends StatelessWidget {
  const _PatientDrawerHeader();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserSuccess) {
          final user = state.user.user;
          return Row(
            children: [
              ProfileImage(
                name: user.name,
                imageUrl: user.image,
                size: 44.w,
              ),

              12.width,

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: context.medium16White.copyWith(
                        letterSpacing: -0.3,
                      ),
                    ),
                    Text(
                      user.email,
                      style: context.regular12White.copyWith(
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _DrawerNavigationSection extends StatelessWidget {
  const _DrawerNavigationSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _DrawerItem(
          title: t.home,
          icon: AppIcons.drawerprofile,
          onTap: () {
            const PatientHomeRoute().go(context);
            _hideDrawer(context);
          },
        ),

        _DrawerItem(
          title: t.favorites,
          icon: AppIcons.drawerFavorite,
          onTap: () {
            const PatientFavoriteRoute().go(context);
            _hideDrawer(context);
          },
        ),

        _DrawerItem(
          title: t.myAppointments,
          icon: AppIcons.drawerAppointments,
          onTap: () {
            const PatientBookingRoute().go(context);
            _hideDrawer(context);
          },
        ),

        _DrawerItem(
          title: t.settings,
          icon: AppIcons.drawerSettings,
          onTap: () {
            const PatientSettingsRoute().go(context);
            _hideDrawer(context);
          },
        ),
      ],
    );
  }

  void _hideDrawer(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 100), () {
      DrawerControllerProvider.of(context).hideDrawer();
    });
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Row(
          children: [
            SizedBox(
              width: 22,
              child: Center(
                child: SvgPicture.asset(
                  icon,
                  width: 20,
                  height: 20,
                ),
              ),
            ),

            16.width,

            Expanded(
              child: Text(
                title,
                style: context.regular16White.copyWith(
                  letterSpacing: -0.3,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        LogoutDialog.show(context);
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppIcons.logout,
              width: 22,
              height: 22,
            ),

            16.width,

            Text(t.logout, style: context.medium20White),
          ],
        ),
      ),
    );
  }
}
