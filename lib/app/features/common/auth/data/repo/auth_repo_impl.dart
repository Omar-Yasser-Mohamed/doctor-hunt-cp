import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/common/auth/data/models/login_request.dart';
import 'package:doctor_hunt/app/features/common/auth/data/models/register_request.dart';
import 'package:doctor_hunt/app/features/common/auth/data/repo/auth_repo.dart';
import 'package:doctor_hunt/app/features/common/auth/data/service/auth_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl(this._authService);
  final AuthService _authService;

  @override
  Future<Either<String, void>> login(LoginRequest request) async {
    try {
      await _authService.login(request);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> signUp(RegisterRequest request) async {
    try {
      await _authService.signUp(request);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> signInWithGoogle() async {
    try {
      await _authService.googleSignUp();
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }
}