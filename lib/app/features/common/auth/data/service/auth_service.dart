import 'package:doctor_hunt/app/core/constants/supabase_constants.dart';
import 'package:doctor_hunt/app/core/shared/models/user_model.dart';
import 'package:doctor_hunt/app/features/common/auth/data/models/login_request.dart';
import 'package:doctor_hunt/app/features/common/auth/data/models/register_request.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthService {
  Future<UserModel> login(LoginRequest request);
  Future<UserModel> signUp(RegisterRequest request);
  Future<UserModel> googleSignUp();
  Future<void> forgetPassword(String email);
  Future<void> verifyOtp(String email, String otp);
  Future<void> resetPassword(String password);
}

@LazySingleton(as: AuthService)
class AuthServiceImpl implements AuthService {
  AuthServiceImpl(this._supabase, this.googleSignIn);
  final SupabaseClient _supabase;
  final GoogleSignIn googleSignIn;

  @override
  Future<UserModel> login(LoginRequest request) async {
    await _supabase.auth.signInWithPassword(
      email: request.email,
      password: request.password,
    );

    final user = _supabase.auth.currentUser;

    if (user == null) {
      throw const AuthException(
        'User not found',
        code: 'user_not_found',
      );
    }

    return UserModel.fromAuth(user);
  }

  @override
  Future<UserModel> signUp(RegisterRequest request) async {
    await _supabase.auth.signUp(
      email: request.email,
      password: request.password,
      data: {
        'name': request.name,
        'user_role': request.userRole.name,
      },
    );

    final user = _supabase.auth.currentUser;

    if (user == null) {
      throw const AuthException(
        'User not found',
        code: 'user_not_found',
      );
    }

    return UserModel.fromAuth(user);
  }

  @override
  Future<UserModel> googleSignUp() async {
    await googleSignIn.initialize(
      serverClientId: SupabaseConstants.googleWebClientId,
      clientId: SupabaseConstants.iosClientId,
    );

    final googleUser = await googleSignIn.authenticate();

    const scopes = ['email', 'profile'];
    final authorization =
        await googleUser.authorizationClient.authorizationForScopes(scopes) ??
        await googleUser.authorizationClient.authorizeScopes(scopes);

    final idToken = googleUser.authentication.idToken;

    if (idToken == null) {
      throw const GoogleSignInException(
        code: GoogleSignInExceptionCode.unknownError,
      );
    }

    await _supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: authorization.accessToken,
    );

    final user = _supabase.auth.currentUser;

    if (user == null) {
      throw const AuthException(
        'User not found',
        code: 'user_not_found',
      );
    }

    return UserModel.fromAuth(user);
  }

  @override
  Future<void> forgetPassword(String email) async {
    await _supabase.auth.resetPasswordForEmail(email);
  }

  @override
  Future<void> resetPassword(String password) async {
    await _supabase.auth.updateUser(UserAttributes(password: password));
  }

  @override
  Future<void> verifyOtp(String email, String otp) async {
    await _supabase.auth.verifyOTP(
      email: email,
      token: otp,
      type: OtpType.recovery,
    );
  }
}
