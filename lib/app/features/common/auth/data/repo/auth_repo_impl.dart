import 'dart:developer';

import 'package:doctor_hunt/app/core/error/error_handler.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/user_model.dart';
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
  Future<Either<Failure, UserModel>> login(LoginRequest request) async {
    try {
      final user = await _authService.login(request);
      return Right(user);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUp(RegisterRequest request) async {
    try {
      final user = await _authService.signUp(request);
      return Right(user);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signInWithGoogle() async {
    try {
      final user = await _authService.googleSignUp();
      return Right(user);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> forgetPassword(String email) async {
    try {
      await _authService.forgetPassword(email);
      return const Right(null);
    } catch (e) {
      log(e.toString());
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> verifyOtp(String email, String otp) async {
    try {
      await _authService.verifyOtp(email, otp);
      return const Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String password) async {
    try {
      await _authService.resetPassword(password);
      return const Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}