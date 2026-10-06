abstract final class SupabaseConstants {
  static const String supabaseUrl = 'https://fzevizojhpbupiopjhpq.supabase.co';
  static const String supabaseAnonKey =
      'sb_publishable_M74z5LSTPTOgADLxapq6ig_BZU3JFvS';
  static const String googleWebClientId = '785921823102-005jtf2tqdrhe8g9rupmc15i7d93nsuh.apps.googleusercontent.com';
  static const String iosClientId = '785921823102-005jtf2tqdrhe8g9rupmc15i7d93nsuh.apps.googleusercontent.com';

  // tables name
  static const String usersTable = 'users';
  static const String adminsTable = 'admins';
  static const String doctorsTable = 'doctors';
  static const String doctorAvailabilityTable = 'doctors_availability';

  // Storage bucket
  static const String doctorPhotosBucket = 'doctor-photos';

  // Procedures
  static const String getDoctorStatsProcedure = 'get_doctor_stats';
  static const String getDoctorSpecialtyCountsProcedure = 'get_doctor_specialty_counts';
}
