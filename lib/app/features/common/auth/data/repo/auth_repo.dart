import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/common/auth/data/models/login_request.dart';
import 'package:doctor_hunt/app/features/common/auth/data/models/register_request.dart';

abstract class AuthRepo {
  Future<Either<String, void>> login(LoginRequest request);
  Future<Either<String, void>> signUp(RegisterRequest request);
  Future<Either<String, void>> signInWithGoogle();
}
