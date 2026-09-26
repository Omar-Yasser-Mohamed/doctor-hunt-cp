enum FailureCode {
  // General
  unknown,
  network,
  timeout,
  invalidRole,

  // HTTP / Supabase
  badRequest,          // 400
  unauthorized,        // 401
  forbidden,           // 403
  notFound,            // 404
  conflict,            // 409
  tooManyRequests,     // 429
  serverError,         // 500
  serviceUnavailable,  // 503

  // Supabase Auth
  invalidCredentials,
  emailAlreadyExists,
  emailNotConfirmed,
  weakPassword,
  userNotFound,
  sessionExpired,
  otpExpired,

  // Supabase Database
  databaseError,
  permissionDenied,

  // Google
  googleSignInFailed,
}