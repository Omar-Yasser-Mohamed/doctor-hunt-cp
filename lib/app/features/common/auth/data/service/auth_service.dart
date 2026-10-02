import 'package:doctor_hunt/app/core/constants/supabase_constants.dart';
import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:doctor_hunt/app/core/shared/models/admin_model.dart';
import 'package:doctor_hunt/app/core/shared/models/current_user_model.dart';
import 'package:doctor_hunt/app/core/shared/models/user_model.dart';
import 'package:doctor_hunt/app/features/common/auth/data/models/login_request.dart';
import 'package:doctor_hunt/app/features/common/auth/data/models/register_request.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthService {
  Future<CurrentUserModel> login(LoginRequest request);
  Future<CurrentUserModel> signUp(RegisterRequest request);
  Future<CurrentUserModel> googleSignUp();
  Future<void> forgetPassword(String email);
  Future<void> verifyOtp(String email, String otp);
  Future<void> resetPassword(String password);
  Future<CurrentUserModel> getCurrentUserProfile();
}

@LazySingleton(as: AuthService)
class AuthServiceImpl implements AuthService {
  AuthServiceImpl(this._supabase, this.googleSignIn);
  final SupabaseClient _supabase;
  final GoogleSignIn googleSignIn;

  @override
  Future<CurrentUserModel> login(LoginRequest request) async {
    await _supabase.auth.signInWithPassword(
      email: request.email,
      password: request.password,
    );

    return _fetchCurrentUserProfile();
  }

  @override
  Future<CurrentUserModel> signUp(RegisterRequest request) async {
    await _supabase.auth.signUp(
      email: request.email,
      password: request.password,
      data: {
        'name': request.name,
        'user_role': UserRole.patient.value,
      },
    );

    return _fetchCurrentUserProfile();
  }

  @override
  Future<CurrentUserModel> googleSignUp() async {
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

    return _fetchCurrentUserProfile();
  }

  @override
  Future<void> forgetPassword(String email) async {
    await _supabase.auth.resetPasswordForEmail(email);
  }

  @override
  Future<void> verifyOtp(String email, String otp) async {
    await _supabase.auth.verifyOTP(
      email: email,
      token: otp,
      type: OtpType.recovery,
    );
  }

  @override
  Future<void> resetPassword(String password) async {
    await _supabase.auth.updateUser(
      UserAttributes(password: password),
    );
  }

  @override
  Future<CurrentUserModel> getCurrentUserProfile() {
    return _fetchCurrentUserProfile();
  }

  Future<CurrentUserModel> _fetchCurrentUserProfile() async {
    final authUser = _supabase.auth.currentUser;

    if (authUser == null) {
      throw const AuthException(
        'User is not authenticated',
        code: 'user_not_authenticated',
      );
    }

    final response = await _supabase
        .from(SupabaseConstants.usersTable)
        .select('''
          *,
          admins (
            user_id,
            address,
            latitude,
            longitude
          )
        ''')
        .eq('id', authUser.id)
        .single();

    final user = UserModel.fromJson(response);

    final adminJson = response['admins'] as Map<String, dynamic>?;

    final admin = adminJson == null ? null : AdminModel.fromJson(adminJson);

    return CurrentUserModel(user: user, admin: admin);
  }
}