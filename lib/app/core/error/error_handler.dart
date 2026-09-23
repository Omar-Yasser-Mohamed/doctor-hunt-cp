import 'dart:async';
import 'dart:developer';

import 'package:doctor_hunt/app/core/error/exceptions.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/error/failure_code.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ErrorHandler {
  static Failure handle(Object error) {
    if (kDebugMode) {
      log(
        'ErrorHandler: $error',
        error: error,
      );
    }

    // Network
    if (error is NoInternetException) {
      return AppFailure(
        code: FailureCode.network,
        message: t.errors.network,
      );
    }

    // Timeout
    if (error is TimeoutException) {
      return AppFailure(
        code: FailureCode.timeout,
        message: t.errors.timeout,
      );
    }

    // Google Sign-In
    if (error is GoogleSignInException) {
      return AppFailure(
        code: FailureCode.googleSignInFailed,
        message: t.errors.googleSignInFailed,
      );
    }

    // Supabase Auth
    if (error is AuthException) {
      return _handleAuthException(error);
    }

    // Supabase Database
    if (error is PostgrestException) {
      return _handlePostgrestException(error);
    }

    // Unknown
    return AppFailure(
      code: FailureCode.unknown,
      message: t.errors.unknown,
    );
  }

  static Failure _handleAuthException(AuthException error) {
    return switch (error.code) {
      'invalid_credentials' => AppFailure(
          code: FailureCode.invalidCredentials,
          message: t.errors.invalidCredentials,
        ),

      'email_exists' ||
      'user_already_exists' => AppFailure(
          code: FailureCode.emailAlreadyExists,
          message: t.errors.emailAlreadyExists,
        ),

      'email_not_confirmed' => AppFailure(
          code: FailureCode.emailNotConfirmed,
          message: t.errors.emailNotConfirmed,
        ),

      'weak_password' => AppFailure(
          code: FailureCode.weakPassword,
          message: t.errors.weakPassword,
        ),

      'user_not_found' => AppFailure(
          code: FailureCode.userNotFound,
          message: t.errors.userNotFound,
        ),

      'session_expired' => AppFailure(
          code: FailureCode.sessionExpired,
          message: t.errors.sessionExpired,
        ),

      'otp_expired' => AppFailure(
          code: FailureCode.otpExpired,
          message: t.errors.otpExpired,
        ),

      'over_request_rate_limit' ||
      'over_email_send_rate_limit' => AppFailure(
          code: FailureCode.tooManyRequests,
          message: t.errors.tooManyRequests,
        ),

      _ => _handleStatusCode(error.statusCode),
    };
  }

  static Failure _handlePostgrestException(
    PostgrestException error,
  ) {
    return switch (error.code) {
      // PostgreSQL: insufficient privilege
      '42501' => AppFailure(
          code: FailureCode.permissionDenied,
          message: t.errors.permissionDenied,
        ),

      // PostgreSQL: unique violation
      '23505' => AppFailure(
          code: FailureCode.conflict,
          message: t.errors.conflict,
        ),

      _ => _handleStatusCode(error.code),
    };
  }

  static Failure _handleStatusCode(String? statusCode) {
    return switch (statusCode) {
      '400' => AppFailure(
          code: FailureCode.badRequest,
          message: t.errors.badRequest,
        ),

      '401' => AppFailure(
          code: FailureCode.unauthorized,
          message: t.errors.unauthorized,
        ),

      '403' => AppFailure(
          code: FailureCode.forbidden,
          message: t.errors.forbidden,
        ),

      '404' => AppFailure(
          code: FailureCode.notFound,
          message: t.errors.notFound,
        ),

      '409' => AppFailure(
          code: FailureCode.conflict,
          message: t.errors.conflict,
        ),

      '429' => AppFailure(
          code: FailureCode.tooManyRequests,
          message: t.errors.tooManyRequests,
        ),

      '500' => AppFailure(
          code: FailureCode.serverError,
          message: t.errors.serverError,
        ),

      '503' => AppFailure(
          code: FailureCode.serviceUnavailable,
          message: t.errors.serviceUnavailable,
        ),

      _ => AppFailure(
          code: FailureCode.unknown,
          message: t.errors.unknown,
        ),
    };
  }
}