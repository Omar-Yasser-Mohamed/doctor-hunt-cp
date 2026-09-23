import 'package:doctor_hunt/app/core/di/injectable.dart';
import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:doctor_hunt/app/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/app/core/widgets/patient_nav_bar.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/google_bloc/google_bloc.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/login_bloc/login_bloc.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/register_bloc/register_bloc.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/screens/login_screen.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/screens/register_screen.dart';
import 'package:doctor_hunt/app/features/common/choose_role/presentation/controller/choose_role_bloc/choose_role_bloc.dart';
import 'package:doctor_hunt/app/features/common/choose_role/presentation/screens/choose_role_screen.dart';
import 'package:doctor_hunt/app/features/common/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:doctor_hunt/app/features/common/splash/presentation/screens/splash_screen.dart';
import 'package:doctor_hunt/app/features/patient/appointment/presentation/screens/patient_appointment_screen.dart';
import 'package:doctor_hunt/app/features/patient/doctor_details/presentation/screens/patient_doctor_details_screen.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/screens/patient_home_screen.dart';
import 'package:doctor_hunt/app/features/patient/search/presentation/screens/patient_find_doctors_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'app_routes.g.dart';

final GoRouter router = GoRouter(routes: $appRoutes);

@TypedGoRoute<SplashRoute>(path: '/')
class SplashRoute extends GoRouteData with $SplashRoute {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SplashScreen();
}

@TypedGoRoute<OnboardingRoute>(path: '/onboarding')
class OnboardingRoute extends GoRouteData with $OnboardingRoute {
  const OnboardingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OnboardingScreen();
}

@TypedGoRoute<ChooseRoleRoute>(path: '/chooseRole')
class ChooseRoleRoute extends GoRouteData with $ChooseRoleRoute {
  const ChooseRoleRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => BlocProvider(
    create: (context) => getIt<ChooseRoleBloc>(),
    child: const ChooseRoleScreen(),
  );
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute({required this.$extra});
  final UserRole $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => getIt<LoginBloc>()),
      BlocProvider(create: (context) => getIt<GoogleBloc>()),
    ],
    child: const LoginScreen(),
  );
}

@TypedGoRoute<RegisterRoute>(path: '/register')
class RegisterRoute extends GoRouteData with $RegisterRoute {
  const RegisterRoute({required this.$extra});
  final UserRole $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) => MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => getIt<RegisterBloc>(),
      ),
      BlocProvider(
        create: (context) => getIt<GoogleBloc>(),
      ),
    ],
    child: const RegisterScreen(),
  );
}

// nav bar routes
@TypedStatefulShellRoute<PatientShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<PatientHomeBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<PatientHomeRoute>(path: '/patientHome'),
      ],
    ),
    TypedStatefulShellBranch<PatientFavoriteBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<PatientFavoriteRoute>(path: '/patientFavorite'),
      ],
    ),
    TypedStatefulShellBranch<PatientBookingBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<PatientBookingRoute>(path: '/patientBooking'),
      ],
    ),
    TypedStatefulShellBranch<PatientConversationsBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<PatientConversationsRoute>(path: '/patientConversations'),
      ],
    ),
  ],
)
class PatientShellRouteData extends StatefulShellRouteData {
  const PatientShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return PatientNavBar(navigationShell: navigationShell);
  }
}

class PatientHomeBranchData extends StatefulShellBranchData {
  const PatientHomeBranchData();
}

class PatientHomeRoute extends GoRouteData with $PatientHomeRoute {
  const PatientHomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const PatientHomeScreen();
}

class PatientFavoriteBranchData extends StatefulShellBranchData {
  const PatientFavoriteBranchData();
}

class PatientFavoriteRoute extends GoRouteData with $PatientFavoriteRoute {
  const PatientFavoriteRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const AppScaffold(
    child: Center(
      child: Text("Favorites"),
    ),
  );
}

class PatientBookingBranchData extends StatefulShellBranchData {
  const PatientBookingBranchData();
}

class PatientBookingRoute extends GoRouteData with $PatientBookingRoute {
  const PatientBookingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const AppScaffold(
    child: Center(
      child: Text("Bookings"),
    ),
  );
}

class PatientConversationsBranchData extends StatefulShellBranchData {
  const PatientConversationsBranchData();
}

class PatientConversationsRoute extends GoRouteData
    with $PatientConversationsRoute {
  const PatientConversationsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const AppScaffold(
    child: Center(
      child: Text("conversations"),
    ),
  );
}

// other app routes
@TypedGoRoute<PatientDoctorDetailsRoute>(
  path: '/patientDoctorDetails',
)
class PatientDoctorDetailsRoute extends GoRouteData
    with $PatientDoctorDetailsRoute {
  const PatientDoctorDetailsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const PatientDoctorDetailsScreen();
}

@TypedGoRoute<PatientFindDoctorsRoute>(
  path: '/patientFindDoctors',
)
class PatientFindDoctorsRoute extends GoRouteData
    with $PatientFindDoctorsRoute {
  const PatientFindDoctorsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const PatientFindDoctorsScreen();
}

@TypedGoRoute<PatientAppointmentRoute>(
  path: '/patientAppointment',
)
class PatientAppointmentRoute extends GoRouteData
    with $PatientAppointmentRoute {
  const PatientAppointmentRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const PatientAppointmentScreen();
}
