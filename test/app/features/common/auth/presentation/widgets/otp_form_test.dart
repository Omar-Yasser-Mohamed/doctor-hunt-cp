import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/forget_password_bloc/forget_password_bloc.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/otp_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pinput/pinput.dart';

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

  tearDown(() {
    forgetPasswordBloc.close();
  });

  Widget makeTestableWidget({
    required MockForgetPasswordBloc forgetPasswordBloc,
  }) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        home: Scaffold(
          body: BlocProvider<ForgetPasswordBloc>.value(
            value: forgetPasswordBloc,
            child: const OtpForm(),
          ),
        ),
      ),
    );
  }

  group("otp form test", () {
    testWidgets("otp form render success", (tester) async {
      await tester.pumpWidget(
        makeTestableWidget(forgetPasswordBloc: forgetPasswordBloc),
      );
      expect(find.byType(Pinput), findsOneWidget);
      expect(find.byType(AppButton), findsOneWidget);
    });

    testWidgets("otp form validation check", (tester) async {
      await tester.pumpWidget(
        makeTestableWidget(forgetPasswordBloc: forgetPasswordBloc),
      );
      await tester.enterText(find.byType(Pinput), "123456");
      await tester.tap(find.byType(AppButton));
      verify(() => forgetPasswordBloc.add(OtpVerified(otp: "123456"))).called(1);
    });

    testWidgets("invalid form validation", (tester) async {
      await tester.pumpWidget(
        makeTestableWidget(forgetPasswordBloc: forgetPasswordBloc),
      );
      await tester.tap(find.byType(AppButton));
      verifyNever(() => forgetPasswordBloc.add(any()));
    });

    testWidgets(
      "passes loading state to AppButton to showing loading indecator",
      (tester) async {
        when(
          () => forgetPasswordBloc.state,
        ).thenReturn(VerifyOtpLoading());

        await tester.pumpWidget(
          makeTestableWidget(
            forgetPasswordBloc: forgetPasswordBloc,
          ),
        );

        final button = tester.widget<AppButton>(
          find.byType(AppButton),
        );

        expect(button.isLoading, isTrue);
      },
    );
  });
}