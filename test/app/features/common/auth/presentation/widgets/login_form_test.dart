import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/error/failure_code.dart';
import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:doctor_hunt/app/core/shared/models/current_user_model.dart';
import 'package:doctor_hunt/app/core/shared/models/user_model.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/core/widgets/app_text_field.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/controller/admin_doctors_bloc/admin_doctors_bloc.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/screens/admin_doctors_screen.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/login_bloc/login_bloc.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/login_form.dart';
import 'package:doctor_hunt/app/features/common/user/presentation/controller/bloc/user_bloc.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/controller/patient_home_bloc/patient_home_bloc.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/screens/patient_home_screen.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class MockUserBloc extends MockBloc<UserEvent, UserState>
    implements UserBloc {}

class MockPatientHomeBloc
    extends MockBloc<PatientHomeEvent, PatientHomeState>
    implements PatientHomeBloc {}

class MockAdminDoctorsBloc
    extends MockBloc<AdminDoctorsEvent, AdminDoctorsState>
    implements AdminDoctorsBloc {}

class FakeLoginRequest extends Fake implements LoginEvent {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockLoginBloc loginBloc;
  late MockUserBloc userBloc;
  late MockPatientHomeBloc patientHomeBloc;
  late MockAdminDoctorsBloc adminDoctorsBloc;
  late GoRouter testRouter;

  setUp(() {
    loginBloc = MockLoginBloc();
    userBloc = MockUserBloc();
    patientHomeBloc = MockPatientHomeBloc();
    adminDoctorsBloc = MockAdminDoctorsBloc();

    when(() => loginBloc.state).thenReturn(LoginInitial());
    when(() => userBloc.state).thenReturn(const UserInitial());
    when(() => patientHomeBloc.state).thenReturn(PatientHomeInitial());
    when(() => adminDoctorsBloc.state).thenReturn(AdminDoctorsInitial());

    testRouter = GoRouter(
      initialLocation: '/login',
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<LoginBloc>.value(value: loginBloc),
                BlocProvider<UserBloc>.value(value: userBloc),
              ],
              child: const Scaffold(
                body: LoginForm(),
              ),
            );
          },
        ),

        GoRoute(
          path: '/patientHome',
          builder: (context, state) {
            return BlocProvider<PatientHomeBloc>.value(
              value: patientHomeBloc,
              child: const PatientHomeScreen(),
            );
          },
        ),

        GoRoute(
          path: '/adminDoctors',
          builder: (context, state) {
            return BlocProvider<AdminDoctorsBloc>.value(
              value: adminDoctorsBloc,
              child: const AdminDoctorsScreen(),
            );
          },
        ),
      ],
    );
  });

  setUpAll(() {
    registerFallbackValue(FakeLoginRequest());
    LocaleSettings.setLocale(AppLocale.en);
  });

  tearDown(() {
    loginBloc.close();
    userBloc.close();
    patientHomeBloc.close();
    adminDoctorsBloc.close();
  });

  Widget makeTestableWidget({
    required LoginBloc loginBloc,
  }) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp.router(
        routerConfig: testRouter,
        builder: (context, child) {
          return BlocProvider<LoginBloc>.value(
            value: loginBloc,
            child: child,
          );
        },
      ),
    );
  }

  testWidgets('login form render success', (tester) async {
    await tester.pumpWidget(makeTestableWidget(loginBloc: loginBloc));
    expect(find.byType(AppTextField), findsNWidgets(2));
    expect(find.byType(AppButton), findsOneWidget);
  });

  testWidgets(
    'invalid validation',
    (tester) async {
      await tester.pumpWidget(
        makeTestableWidget(
          loginBloc: loginBloc,
        ),
      );

      await tester.tap(find.byType(AppButton));
      await tester.pump();

      verifyNever(
        () => loginBloc.add(any()),
      );
    },
  );

  testWidgets(
    'submit login when form is valid',
    (tester) async {
      await tester.pumpWidget(
        makeTestableWidget(
          loginBloc: loginBloc,
        ),
      );

      final textFields = find.byType(AppTextField);

      await tester.enterText(
        textFields.at(0),
        'omar@gmail.com',
      );

      await tester.enterText(
        textFields.at(1),
        'Omar123!',
      );

      await tester.tap(find.byType(AppButton));

      verify(
        () => loginBloc.add(
          LoginSubmitted(email: "omar@gmail.com", password: "Omar123!"),
        ),
      ).called(1);
    },
  );

  testWidgets(
    'passes loading state to AppButton to showing loading indecator',
    (tester) async {
      when(() => loginBloc.state).thenReturn(LoginLoading());

      await tester.pumpWidget(
        makeTestableWidget(loginBloc: loginBloc),
      );

      final button = tester.widget<AppButton>(
        find.byType(AppButton),
      );

      expect(button.isLoading, isTrue);
    },
  );

  testWidgets(
    'showing snake bar in failure state',
    (tester) async {
      final failure = AppFailure(
        message: t.errors.userNotFound,
        code: FailureCode.userNotFound,
      );

      whenListen(
        loginBloc,
        Stream.fromIterable([
          LoginLoading(),
          LoginFailure(failure),
        ]),
        initialState: LoginInitial(),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          loginBloc: loginBloc,
        ),
      );

      await tester.pump();
      await tester.pump();

      expect(
        find.text(t.errors.userNotFound),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'navigate to patient home on success login',
    (tester) async {
      tester.view.physicalSize = const Size(375, 1200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final user = CurrentUserModel(
        user: UserModel(
          id: '1',
          email: 'omar@gmail.com',
          name: 'Omar',
          userRole: UserRole.patient,
          image: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );

      whenListen(
        loginBloc,
        Stream.fromIterable([
          LoginLoading(),
          LoginSuccess(user),
        ]),
        initialState: LoginInitial(),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          loginBloc: loginBloc,
        ),
      );

      // Bounded pumps instead of pumpAndSettle: the destination screen
      // shows a shimmer with an infinite animation that never settles.
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(seconds: 1));

      verify(() => userBloc.add(const GetUserEvent())).called(1);
      expect(
        find.byType(PatientHomeScreen),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'navigate to admin home on success login',
    (tester) async {
      tester.view.physicalSize = const Size(375, 1200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final user = CurrentUserModel(
        user: UserModel(
          id: '1',
          email: 'omar@gmail.com',
          name: 'Omar',
          userRole: UserRole.admin,
          image: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );

      whenListen(
        loginBloc,
        Stream.fromIterable([
          LoginLoading(),
          LoginSuccess(user),
        ]),
        initialState: LoginInitial(),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          loginBloc: loginBloc,
        ),
      );

      // Bounded pumps instead of pumpAndSettle: the destination screen
      // shows a shimmer with an infinite animation that never settles.
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(seconds: 1));

      verify(() => userBloc.add(const GetUserEvent())).called(1);
      expect(
        find.byType(AdminDoctorsScreen),
        findsOneWidget,
      );
    },
  );
}
