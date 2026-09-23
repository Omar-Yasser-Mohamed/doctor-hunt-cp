import 'package:doctor_hunt/app/core/constants/supabase_constants.dart';
import 'package:doctor_hunt/app/features/common/auth/data/models/login_request.dart';
import 'package:doctor_hunt/app/features/common/auth/data/models/register_request.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthService {
  Future<void> login(LoginRequest request);
  Future<void> signUp(RegisterRequest request);
  Future<void> googleSignUp();
}

@LazySingleton(as: AuthService)
class AuthServiceImpl implements AuthService {
  AuthServiceImpl(this._supabase, this.googleSignIn);
  final SupabaseClient _supabase;
  final GoogleSignIn googleSignIn;

  @override
  Future<void> login(LoginRequest request) async {
    await _supabase.auth.signInWithPassword(
      email: request.email,
      password: request.password,
    );
  }

  @override
  Future<void> signUp(RegisterRequest request) async {
    await _supabase.auth.signUp(
      email: request.email,
      password: request.password,
      data: {
        'name': request.name,
        'user_role': request.userRole.name,
      },
    );
  }

  @override
  Future<void> googleSignUp() async {
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
      throw const AuthException('No ID Token found.');
    }

    await _supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: authorization.accessToken,
    );
  }
}
