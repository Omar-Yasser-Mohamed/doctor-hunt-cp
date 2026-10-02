import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/current_user_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/common/auth/data/models/login_request.dart';
import 'package:doctor_hunt/app/features/common/auth/data/models/register_request.dart';

abstract class AuthRepo {
  Future<Either<Failure, CurrentUserModel>> login(LoginRequest request);
  Future<Either<Failure, CurrentUserModel>> signUp(RegisterRequest request);
  Future<Either<Failure, CurrentUserModel>> signInWithGoogle();
  Future<Either<Failure, void>> forgetPassword(String email);
  Future<Either<Failure, void>> verifyOtp(String email, String otp);
  Future<Either<Failure, void>> resetPassword(String password);
}
