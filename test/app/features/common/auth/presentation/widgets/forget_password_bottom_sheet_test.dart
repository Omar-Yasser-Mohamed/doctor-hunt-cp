import 'dart:async';
import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/error/failure_code.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/forget_password_bloc/forget_password_bloc.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/forget_password_bottom_sheet.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/forget_password_view.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/otp_verify_view.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/reset_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockForgetPasswordBloc
    extends MockBloc<ForgetPasswordEvent, ForgetPasswordState>
    implements ForgetPasswordBloc {}

class FakeForgetPasswordEvent extends Fake implements ForgetPasswordEvent {}

void main() {
  late MockForgetPasswordBloc forgetPasswordBloc;

  setUpAll(() {
    registerFallbackValue(FakeForgetPasswordEvent());
  });

  setUp(() {
    forgetPasswordBloc = MockForgetPasswordBloc();

    when(() => forgetPasswordBloc.state).thenReturn(ForgetPasswordInitial());

    when(() => forgetPasswordBloc.close()).thenAnswer((_) async {});
  });

  tearDown(() async {
    await forgetPasswordBloc.close();
  });

  Widget makeTestableWidget() {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        home: Scaffold(
          body: BlocProvider<ForgetPasswordBloc>.value(
            value: forgetPasswordBloc,
            child: const ForgetPasswordBottomSheet(),
          ),
        ),
      ),
    );
  }

  void setTestViewport(WidgetTester tester) {
    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1;

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  }

  group('ForgetPasswordBottomSheet Widget Tests', () {
    testWidgets(
      'shows ForgetPasswordView initially',
      (tester) async {
        setTestViewport(tester);

        await tester.pumpWidget(makeTestableWidget());

        expect(find.byType(ForgetPasswordView), findsOneWidget);
        expect(find.byType(OtpVerifyView), findsNothing);
        expect(find.byType(ResetPasswordView), findsNothing);
      },
    );

    testWidgets(
      'shows OtpVerifyView when forget password succeeds',
      (tester) async {
        setTestViewport(tester);

        final controller = StreamController<ForgetPasswordState>();

        addTearDown(controller.close);

        whenListen(
          forgetPasswordBloc,
          controller.stream,
          initialState: ForgetPasswordInitial(),
        );

        await tester.pumpWidget(makeTestableWidget());

        expect(find.byType(ForgetPasswordView), findsOneWidget);

        controller.add(
          ForgetPasswordSuccess('omar@gmail.com'),
        );

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 350));

        expect(find.byType(OtpVerifyView), findsOneWidget);
        expect(find.byType(ForgetPasswordView), findsNothing);
        expect(find.byType(ResetPasswordView), findsNothing);
      },
    );

    testWidgets(
      'shows ResetPasswordView after OTP verification succeeds',
      (tester) async {
        setTestViewport(tester);

        final controller = StreamController<ForgetPasswordState>();

        addTearDown(controller.close);

        whenListen(
          forgetPasswordBloc,
          controller.stream,
          initialState: ForgetPasswordInitial(),
        );

        await tester.pumpWidget(makeTestableWidget());

        controller.add(
          ForgetPasswordSuccess('omar@gmail.com'),
        );

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 350));

        expect(find.byType(OtpVerifyView), findsOneWidget);

        controller.add(VerifyOtpSuccess());

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 350));

        expect(find.byType(ResetPasswordView), findsOneWidget);
        expect(find.byType(ForgetPasswordView), findsNothing);
        expect(find.byType(OtpVerifyView), findsNothing);
      },
    );

    testWidgets(
      'keeps ForgetPasswordView when forget password fails',
      (tester) async {
        
        setTestViewport(tester);

        final controller = StreamController<ForgetPasswordState>();

        addTearDown(controller.close);

        whenListen(
          forgetPasswordBloc,
          controller.stream,
          initialState: ForgetPasswordInitial(),
        );

        await tester.pumpWidget(makeTestableWidget());

        controller.add(
          ForgetPasswordFailure(
            const AppFailure(
              message: 'test',
              code: FailureCode.userNotFound,
            ),
          ),
        );

        await tester.pump();

        expect(find.byType(ForgetPasswordView), findsOneWidget);
        expect(find.byType(OtpVerifyView), findsNothing);
        expect(find.byType(ResetPasswordView), findsNothing);

        await tester.pump(const Duration(seconds: 5));
      },
    );
  });
}
