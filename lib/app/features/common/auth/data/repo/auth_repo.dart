import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/user_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/common/auth/data/models/login_request.dart';
import 'package:doctor_hunt/app/features/common/auth/data/models/register_request.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> login(LoginRequest request);
  Future<Either<Failure, UserModel>> signUp(RegisterRequest request);
  Future<Either<Failure, UserModel>> signInWithGoogle();
  Future<Either<Failure, void>> forgetPassword(String email);
  Future<Either<Failure, void>> verifyOtp(String email, String otp);
  Future<Either<Failure, void>> resetPassword(String password);
}
