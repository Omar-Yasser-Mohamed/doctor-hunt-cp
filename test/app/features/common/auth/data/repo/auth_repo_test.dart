import 'package:doctor_hunt/app/core/error/exceptions.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/error/failure_code.dart';
import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:doctor_hunt/app/core/shared/models/user_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/common/auth/data/models/login_request.dart';
import 'package:doctor_hunt/app/features/common/auth/data/models/register_request.dart';
import 'package:doctor_hunt/app/features/common/auth/data/repo/auth_repo.dart';
import 'package:doctor_hunt/app/features/common/auth/data/repo/auth_repo_impl.dart';
import 'package:doctor_hunt/app/features/common/auth/data/service/auth_service.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockAuthService extends Mock implements AuthService {}

void main() {
  late MockAuthService mockAuthService;
  late AuthRepo authRepo;

  setUp(() {
    mockAuthService = MockAuthService();
    authRepo = AuthRepoImpl(mockAuthService);
  });

  group("auth repo testing", () {
    group("login testing", () {
      test(
        "login success",
        () async {
          final email = "omar@gmail.com";
          final loginRequest = LoginRequest(
            email: email,
            password: "Omar@1212",
          );

          final user = UserModel(
            id: "1",
            email: email,
            name: "omar",
            userRole: UserRole.patient,
            image: null,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );

          when(
            () => mockAuthService.login(loginRequest),
          ).thenAnswer(
            (_) async => user,
          );

          final result = await authRepo.login(loginRequest);

          expect(result, Right<Failure, UserModel>(user));
        },
      );

      test(
        "login failure",
        () async {
          final email = "omar@gmail.com";
          final loginRequest = LoginRequest(
            email: email,
            password: "Omar@1212",
          );

          when(
            () => mockAuthService.login(loginRequest),
          ).thenThrow(
            const AuthException(
              "test message",
              code: "invalid_credentials",
            ),
          );

          final result = await authRepo.login(loginRequest);

          expect(
            result,
            Left<Failure, UserModel>(
              AppFailure(
                message: t.errors.invalidCredentials,
                code: FailureCode.invalidCredentials,
              ),
            ),
          );
        },
      );
    });

    group("register testing", () {
      test("register success", () async {
        final request = RegisterRequest(
          name: "name",
          userRole: UserRole.admin,
          email: "omar@gmail.com",
          password: "Omar123!",
        );

        final user = UserModel(
          id: "1",
          name: "name",
          userRole: UserRole.admin,
          email: "omar@gmail.com",
          image: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        when(
          () => mockAuthService.signUp(request),
        ).thenAnswer((_) async => user);

        expect(await authRepo.signUp(request), Right<Failure, UserModel>(user));
      });

      test("register failure", () async {
        final request = RegisterRequest(
          name: "name",
          userRole: UserRole.admin,
          email: "omar@gmail.com",
          password: "Omar123!",
        );

        when(
          () => mockAuthService.signUp(request),
        ).thenThrow(NoInternetException());

        expect(
          await authRepo.signUp(request),
          Left<Failure, UserModel>(
            AppFailure(message: t.errors.network, code: FailureCode.network),
          ),
        );
      });
    });

    group("forget password testing", () {
      const email = "omar@gmail.com";
      const otp = "111111";
      const newPassword = "Omar123!";

      test("forget password success", () async {
        when(
          () => mockAuthService.forgetPassword(email),
        ).thenAnswer((_) async => ());

        final result = await authRepo.forgetPassword(email);

        expect(result, const Right<Failure, void>(null));
      });

      test("verify otp success", () async {
        when(
          () => mockAuthService.verifyOtp(email, otp),
        ).thenAnswer((_) async => ());

        final result = await authRepo.verifyOtp(email, otp);

        expect(result, const Right<Failure, void>(null));
      });

      test("reset password success", () async {
        when(
          () => mockAuthService.resetPassword(newPassword),
        ).thenAnswer((_) async => ());

        final result = await authRepo.resetPassword(newPassword);

        expect(result, const Right<Failure, void>(null));
      });
    });
  });
}
