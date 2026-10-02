import 'package:doctor_hunt/app/core/error/exceptions.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/error/failure_code.dart';
import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:doctor_hunt/app/core/shared/models/current_user_model.dart';
import 'package:doctor_hunt/app/core/shared/models/user_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/common/auth/data/models/login_request.dart';
import 'package:doctor_hunt/app/features/common/auth/data/models/register_request.dart';
import 'package:doctor_hunt/app/features/common/auth/data/repo/auth_repo.dart';
import 'package:doctor_hunt/app/features/common/auth/data/repo/auth_repo_impl.dart';
import 'package:doctor_hunt/app/features/common/auth/data/service/auth_service.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:doctor_hunt/app/features/common/user/data/services/user_local_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockAuthService extends Mock implements AuthService {}

class MockUserLocalService extends Mock implements UserLocalService {}

class FakeCurrentUserModel extends Fake implements CurrentUserModel {}

void main() {
  late MockAuthService mockAuthService;
  late MockUserLocalService mockUserLocalService;
  late AuthRepo authRepo;

  setUpAll(() {
    registerFallbackValue(FakeCurrentUserModel());
  });

  setUp(() {
    mockAuthService = MockAuthService();
    mockUserLocalService = MockUserLocalService();
    when(() => mockUserLocalService.saveUser(any())).thenAnswer((_) async {});
    authRepo = AuthRepoImpl(mockAuthService, mockUserLocalService);
    LocaleSettings.setLocale(AppLocale.en);
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

          final user = CurrentUserModel(
            user: UserModel(
              id: "1",
              email: email,
              name: "omar",
              userRole: UserRole.patient,
              image: null,
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ),
          );

          when(
            () => mockAuthService.login(loginRequest),
          ).thenAnswer(
            (_) async => user,
          );

          final result = await authRepo.login(loginRequest);

          expect(result, Right<Failure, CurrentUserModel>(user));
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
            Left<Failure, CurrentUserModel>(
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

        final user = CurrentUserModel(
          user: UserModel(
            id: "1",
            name: "name",
            userRole: UserRole.admin,
            email: "omar@gmail.com",
            image: null,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        );

        when(
          () => mockAuthService.signUp(request),
        ).thenAnswer((_) async => user);

        expect(await authRepo.signUp(request), Right<Failure, CurrentUserModel>(user));
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
          Left<Failure, CurrentUserModel>(
            AppFailure(message: t.errors.network, code: FailureCode.network),
          ),
        );
      });
    });

    group("forget password testing", () {
      const email = "omar@gmail.com";
      const otp = "111111";
      const newPassword = "Omar123!";

      group("forget password", () {
        test("forget password success", () async {
          when(
            () => mockAuthService.forgetPassword(email),
          ).thenAnswer((_) async => ());

          final result = await authRepo.forgetPassword(email);

          expect(result, const Right<Failure, void>(null));
        });

        test("forget password failure", () async {
          when(
            () => mockAuthService.forgetPassword(email),
          ).thenThrow(
            const AuthException("message", code: "user_not_found"),
          );

          final result = await authRepo.forgetPassword(email);

          expect(
            result,
            Left<Failure, void>(
              AppFailure(
                message: t.errors.userNotFound,
                code: FailureCode.userNotFound,
              ),
            ),
          );
        });
      });

      group("verify otp", () {
        test("verify otp success", () async {
          when(
            () => mockAuthService.verifyOtp(email, otp),
          ).thenAnswer((_) async => ());

          final result = await authRepo.verifyOtp(email, otp);

          expect(result, const Right<Failure, void>(null));
        });

        test("verify otp failure", () async {
          when(
            () => mockAuthService.verifyOtp(email, otp),
          ).thenThrow(
            const AuthException("message", code: "otp_expired"),
          );

          final result = await authRepo.verifyOtp(email, otp);

          expect(
            result,
            Left<Failure, void>(
              AppFailure(
                message: t.errors.otpExpired,
                code: FailureCode.otpExpired,
              ),
            ),
          );
        });
      });

      group("reset password", () {
        test("reset password success", () async {
          when(
            () => mockAuthService.resetPassword(newPassword),
          ).thenAnswer((_) async => ());

          final result = await authRepo.resetPassword(newPassword);

          expect(result, const Right<Failure, void>(null));
        });

        test("reset password failure", () async {
          when(
            () => mockAuthService.resetPassword(newPassword),
          ).thenThrow(
            const AuthException("message", code: "same_password"),
          );

          final result = await authRepo.resetPassword(newPassword);

          expect(
            result,
            Left<Failure, void>(
              AppFailure(
                message: t.errors.samePassword,
                code: FailureCode.samePassword,
              ),
            ),
          );
        });
      });
    });

    group("google testing", () {
      test("google login success", () async {
        final user = CurrentUserModel(
          user: UserModel(
            id: "1",
            email: "omar@gmail.com",
            name: "omar",
            userRole: UserRole.patient,
            image: null,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        );

        when(
          () => mockAuthService.googleSignUp(),
        ).thenAnswer(
          (_) async => user,
        );

        final result = await authRepo.signInWithGoogle();

        expect(result, Right<Failure, CurrentUserModel>(user));
      });

      test("google login failure", () async {
        when(
          () => mockAuthService.googleSignUp(),
        ).thenThrow(
          const GoogleSignInException(
            code: GoogleSignInExceptionCode.unknownError,
          ),
        );

        final result = await authRepo.signInWithGoogle();

        expect(
          result,
          Left<Failure, CurrentUserModel>(
            AppFailure(
              message: t.errors.googleSignInFailed,
              code: FailureCode.googleSignInFailed,
            ),
          ),
        );
      });
    });
  });
}
