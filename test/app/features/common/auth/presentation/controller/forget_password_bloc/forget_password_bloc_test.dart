import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/error/failure_code.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:doctor_hunt/app/features/common/auth/data/repo/auth_repo.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/forget_password_bloc/forget_password_bloc.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

void main() {
  late AuthRepo authRepo;
  late ForgetPasswordBloc forgetPasswordBloc;

  setUpAll(() {
    authRepo = MockAuthRepo();
  });

  setUp(() {
    forgetPasswordBloc = ForgetPasswordBloc(authRepo);
  });

  final email = "omar@gmail.com";
  final otp = "111111";
  final password = "Omar123!";

  final failure = AppFailure(
    message: t.errors.userNotFound,
    code: FailureCode.userNotFound,
  );

  group('forget password bloc flow test', () {
    group("forget password tests", () {
      blocTest(
        "forget password success",
        build: () {
          when(
            () => authRepo.forgetPassword(email),
          ).thenAnswer((_) async => const Right(null));
          return forgetPasswordBloc;
        },
        act: (bloc) {
          bloc.add(
            ForgetPasswordRequested(email),
          );
        },
        expect: () => [
          ForgetPasswordLoading(),
          ForgetPasswordSuccess(email),
        ],
        verify: (_) {
          verify(() => authRepo.forgetPassword(email)).called(1);
        },
      );

      blocTest(
        "forget password failure",
        build: () {
          when(
            () => authRepo.forgetPassword(email),
          ).thenAnswer((_) async => Left(failure));
          return forgetPasswordBloc;
        },
        act: (bloc) {
          bloc.add(
            ForgetPasswordRequested(email),
          );
        },
        expect: () => [
          ForgetPasswordLoading(),
          ForgetPasswordFailure(failure),
        ],
        verify: (_) {
          verify(() => authRepo.forgetPassword(email)).called(1);
        },
      );
    });

    group("OTP verification tests", () {
      blocTest(
        "OTP verification success",
        build: () {
          when(
            () => authRepo.forgetPassword(email),
          ).thenAnswer((_) async => const Right(null));

          when(
            () => authRepo.verifyOtp(email, otp),
          ).thenAnswer((_) async => const Right(null));

          return ForgetPasswordBloc(authRepo);
        },
        act: (bloc) async {
          bloc.add(ForgetPasswordRequested(email));

          await Future.delayed(Duration.zero);

          bloc.add(OtpVerified(otp: otp));
        },
        expect: () => [
          ForgetPasswordLoading(),
          ForgetPasswordSuccess(email),
          VerifyOtpLoading(),
          VerifyOtpSuccess(),
        ],
        verify: (_) {
          verify(() => authRepo.forgetPassword(email)).called(1);
          verify(() => authRepo.verifyOtp(email, otp)).called(1);
        },
      );

      blocTest(
        "OTP verification failure",
        build: () {
          when(
            () => authRepo.forgetPassword(email),
          ).thenAnswer((_) async => const Right(null));

          when(
            () => authRepo.verifyOtp(email, otp),
          ).thenAnswer((_) async => Left(failure));

          return ForgetPasswordBloc(authRepo);
        },
        act: (bloc) async {
          bloc.add(ForgetPasswordRequested(email));

          await Future.delayed(Duration.zero);

          bloc.add(OtpVerified(otp: otp));
        },
        expect: () => [
          ForgetPasswordLoading(),
          ForgetPasswordSuccess(email),
          VerifyOtpLoading(),
          ForgetPasswordFailure(failure),
        ],
        verify: (_) {
          verify(() => authRepo.forgetPassword(email)).called(1);
          verify(() => authRepo.verifyOtp(email, otp)).called(1);
        },
      );
    });

    group("reset password tests", () {
      blocTest(
        "reset password success",
        build: () {
          when(
            () => authRepo.resetPassword(password),
          ).thenAnswer((_) async => const Right(null));
          return forgetPasswordBloc;
        },
        act: (bloc) {
          bloc.add(
            ResetPasswordRequested(password: password),
          );
        },
        expect: () => [
          ResetPasswordLoading(),
          ResetPasswordSuccess(),
        ],
        verify: (_) {
          verify(() => authRepo.resetPassword(password)).called(1);
        },
      );

      blocTest(
        "reset password failure",
        build: () {
          when(
            () => authRepo.resetPassword(password),
          ).thenAnswer((_) async => Left(failure));
          return forgetPasswordBloc;
        },
        act: (bloc) {
          bloc.add(
            ResetPasswordRequested(password: password),
          );
        },
        expect: () => [
          ResetPasswordLoading(),
          ForgetPasswordFailure(failure),
        ],
        verify: (_) {
          verify(() => authRepo.resetPassword(password)).called(1);
        },
      );
    });
  });
}
