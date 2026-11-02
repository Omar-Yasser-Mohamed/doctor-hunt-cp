import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class SupabaseConstants {
  static String get supabaseUrl => dotenv.env['SUPABASE_URL']!;
  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY']!;
  static String get googleWebClientId => dotenv.env['GOOGLE_WEB_CLIENT_ID']!;
  static String get iosClientId => dotenv.env['IOS_CLIENT_ID']!;

  // tables name
  static String get usersTable => dotenv.env['USERS_TABLE']!;
  static String get adminsTable => dotenv.env['ADMINS_TABLE']!;
  static String get doctorsTable => dotenv.env['DOCTORS_TABLE']!;
  static String get doctorAvailabilityTable =>
      dotenv.env['DOCTOR_AVAILABILITY_TABLE']!;
  static String get favoritesTable => dotenv.env['FAVORITES_TABLE']!;
  static String get appointmentsTable => dotenv.env['APPOINTMENTS_TABLE']!;
  static String get appointmentReviewsTable =>
      dotenv.env['APPOINTMENT_REVIEWS_TABLE']!;

  // Storage bucket
  static String get doctorPhotosBucket => dotenv.env['DOCTOR_PHOTOS_BUCKET']!;

  // Procedures
  static String get getDoctorStatsProcedure =>
      dotenv.env['GET_DOCTOR_STATS_PROCEDURE']!;
  static String get getDoctorSpecialtyCountsProcedure =>
      dotenv.env['GET_DOCTOR_SPECIALTY_COUNTS_PROCEDURE']!;
  static String get bookAppointmentProcedure =>
      dotenv.env['BOOK_APPOINTMENT_PROCEDURE']!;
  static String get completeAppointmentProcedure =>
      dotenv.env['COMPLETE_APPOINTMENT_PROCEDURE']!;
  static String get submitAppointmentReviewProcedure =>
      dotenv.env['SUBMIT_APPOINTMENT_REVIEW_PROCEDURE']!;

  // Edge Functions
  static String get createDoctorEdgeFunction =>
      dotenv.env['CREATE_DOCTOR_EDGE_FUNCTION']!;
  static String get updateDoctorEdgeFunction =>
      dotenv.env['UPDATE_DOCTOR_EDGE_FUNCTION']!;
  static String get deleteDoctorEdgeFunction =>
      dotenv.env['DELETE_DOCTOR_EDGE_FUNCTION']!;
  static String get updateAdminProfileEdgeFunction =>
      dotenv.env['UPDATE_ADMIN_PROFILE_EDGE_FUNCTION']!;
  static String get updatePatientProfileEdgeFunction =>
      dotenv.env['UPDATE_PATIENT_PROFILE_EDGE_FUNCTION']!;
}
