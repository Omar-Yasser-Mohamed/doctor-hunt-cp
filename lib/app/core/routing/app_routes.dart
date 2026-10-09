import 'package:doctor_hunt/app/core/di/injectable.dart';
import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/widgets/patient_scaffold.dart';
import 'package:doctor_hunt/app/core/widgets/patient_nav_bar.dart';
import 'package:doctor_hunt/app/core/widgets/admin_nav_bar.dart';
import 'package:doctor_hunt/app/core/widgets/admin_scaffold.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/presentation/controller/doctor_availability_bloc/doctor_availability_bloc.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/presentation/screens/admin_doctor_availability_screen.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_details/presentation/controller/bloc/admin_doctor_details_bloc.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_details/presentation/screens/admin_doctor_details_screen.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/presentation/controller/doctor_management_bloc/doctor_management_bloc.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/presentation/screens/edit_doctor_screen.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/controller/admin_doctors_bloc/admin_doctors_bloc.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/screens/admin_doctors_screen.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/presentation/screens/create_doctor_screen.dart';
import 'package:doctor_hunt/app/features/admin/admin_profile/presentation/screens/admin_edit_profile_screen.dart';
import 'package:doctor_hunt/app/features/admin/admin_settings/presentation/screens/admin_settings_screen.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/google_bloc/google_bloc.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/login_bloc/login_bloc.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/logout_bloc/logout_bloc.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/register_bloc/register_bloc.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/screens/login_screen.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/screens/register_screen.dart';
import 'package:doctor_hunt/app/features/common/choose_role/presentation/controller/choose_role_bloc/choose_role_bloc.dart';
import 'package:doctor_hunt/app/features/common/choose_role/presentation/screens/choose_role_screen.dart';
import 'package:doctor_hunt/app/features/common/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:doctor_hunt/app/features/common/splash/presentation/screens/splash_screen.dart';
import 'package:doctor_hunt/app/features/patient/patient_appointment/presentation/screens/patient_appointment_screen.dart';
import 'package:doctor_hunt/app/features/patient/patient_doctor_details/presentation/controller/patient_doctor_details_bloc/patient_doctor_details_bloc.dart';
import 'package:doctor_hunt/app/features/patient/patient_doctor_details/presentation/screens/patient_doctor_details_screen.dart';
import 'package:doctor_hunt/app/features/patient/patient_find_doctors/presentation/controller/find_doctors_bloc/find_doctors_bloc.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/controller/patient_doctors_list_bloc/patient_doctors_list_bloc.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/controller/patient_home_bloc/patient_home_bloc.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/params/doctors_filter.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/screens/patient_doctors_list_screen.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/screens/patient_home_screen.dart';
import 'package:doctor_hunt/app/features/patient/patient_find_doctors/presentation/screens/patient_find_doctors_screen.dart';
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
    TypedStatefulShellBranch<PatientSettingsBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<PatientSettingsRoute>(path: '/patientSettings'),
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
    return BlocProvider(
      create: (context) =>
          getIt<PatientHomeBloc>()..add(const GetHomeDoctors()),
      child: PatientNavBar(navigationShell: navigationShell),
    );
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

class PatientSettingsBranchData extends StatefulShellBranchData {
  const PatientSettingsBranchData();
}

class PatientSettingsRoute extends GoRouteData with $PatientSettingsRoute {
  const PatientSettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const AppScaffold(
    child: Center(
      child: Text("Settings"),
    ),
  );
}

// other app routes
@TypedGoRoute<PatientDoctorDetailsRoute>(
  path: '/patientDoctorDetails',
)
class PatientDoctorDetailsRoute extends GoRouteData
    with $PatientDoctorDetailsRoute {
  const PatientDoctorDetailsRoute({required this.$extra});
  final String $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) => BlocProvider(
    create: (context) =>
        getIt<PatientDoctorDetailsBloc>()
          ..add(GetPatientDoctorDetailsEvent(doctorId: $extra)),
    child: const PatientDoctorDetailsScreen(),
  );
}

@TypedGoRoute<PatientFindDoctorsRoute>(
  path: '/patientFindDoctors',
)
class PatientFindDoctorsRoute extends GoRouteData
    with $PatientFindDoctorsRoute {
  const PatientFindDoctorsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => BlocProvider(
    create: (context) => getIt<FindDoctorsBloc>(),
    child: const PatientFindDoctorsScreen(),
  );
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

@TypedGoRoute<PatientDoctorsListRoute>(
  path: '/patientDoctorsList',
)
class PatientDoctorsListRoute extends GoRouteData
    with $PatientDoctorsListRoute {
  const PatientDoctorsListRoute({required this.$extra});
  final DoctorsFilter $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) => BlocProvider(
    create: (context) =>
        getIt<PatientDoctorsListBloc>()
          ..add(GetDoctorsList(doctorsFilter: $extra)),
    child: const PatientDoctorsListScreen(),
  );
}

/// Admin Routes
@TypedStatefulShellRoute<AdminShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<AdminDoctorsBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<AdminDoctorsRoute>(path: '/adminDoctors'),
      ],
    ),
    TypedStatefulShellBranch<AdminAppointmentsBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<AdminAppointmentsRoute>(path: '/adminAppointments'),
      ],
    ),
    TypedStatefulShellBranch<AdminSettingsBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<AdminSettingsRoute>(path: '/adminSettings'),
      ],
    ),
  ],
)
class AdminShellRouteData extends StatefulShellRouteData {
  const AdminShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return BlocProvider(
      create: (context) =>
          getIt<AdminDoctorsBloc>()..add(const LoadAdminDoctorsEvent()),
      child: AdminNavBar(navigationShell: navigationShell),
    );
  }
}

class AdminDoctorsBranchData extends StatefulShellBranchData {
  const AdminDoctorsBranchData();
}

class AdminDoctorsRoute extends GoRouteData with $AdminDoctorsRoute {
  const AdminDoctorsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AdminDoctorsScreen();
}

class AdminAppointmentsBranchData extends StatefulShellBranchData {
  const AdminAppointmentsBranchData();
}

class AdminAppointmentsRoute extends GoRouteData with $AdminAppointmentsRoute {
  const AdminAppointmentsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AdminScaffold(
        body: Center(
          child: Text('Appointments'),
        ),
      );
}

class AdminSettingsBranchData extends StatefulShellBranchData {
  const AdminSettingsBranchData();
}

class AdminSettingsRoute extends GoRouteData with $AdminSettingsRoute {
  const AdminSettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => BlocProvider(
    create: (context) => getIt<LogoutBloc>(),
    child: const AdminSettingsScreen(),
  );
}

@TypedGoRoute<AdminDoctorDetailsRoute>(path: '/adminDoctorDetails')
class AdminDoctorDetailsRoute extends GoRouteData
    with $AdminDoctorDetailsRoute {
  const AdminDoctorDetailsRoute({required this.$extra});
  final String $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) => BlocProvider(
    create: (context) =>
        getIt<AdminDoctorDetailsBloc>()
          ..add(GetDoctorDetailsEvent(doctorId: $extra)),
    child: const AdminDoctorDetailsScreen(),
  );
}

@TypedGoRoute<CreateDoctorRoute>(path: '/adminCreateDoctor')
class CreateDoctorRoute extends GoRouteData with $CreateDoctorRoute {
  const CreateDoctorRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => BlocProvider(
    create: (context) => getIt<DoctorManagementBloc>(),
    child: const CreateDoctorScreen(),
  );
}

@TypedGoRoute<EditDoctorRoute>(path: '/adminEditDoctor')
class EditDoctorRoute extends GoRouteData with $EditDoctorRoute {
  const EditDoctorRoute({required this.$extra});
  final DoctorModel $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) => BlocProvider(
    create: (context) => getIt<DoctorManagementBloc>(),
    child: EditDoctorScreen(doctor: $extra),
  );
}

@TypedGoRoute<AdminDoctorAvailabilityRoute>(
  path: '/adminDoctorAvailability',
)
class AdminDoctorAvailabilityRoute extends GoRouteData
    with $AdminDoctorAvailabilityRoute {
  const AdminDoctorAvailabilityRoute({required this.$extra});
  final DoctorModel $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) => BlocProvider(
    create: (context) =>
        getIt<DoctorAvailabilityBloc>()
          ..add(GetDoctorAvailabilityEvent($extra.id)),
    child: const AdminDoctorAvailabilityScreen(),
  );
}

@TypedGoRoute<AdminEditProfileRoute>(path: '/adminEditProfile')
class AdminEditProfileRoute extends GoRouteData with $AdminEditProfileRoute {
  const AdminEditProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AdminEditProfileScreen();
}
