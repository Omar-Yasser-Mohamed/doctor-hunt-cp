import 'package:doctor_hunt/app/core/constants/supabase_constants.dart';
import 'package:doctor_hunt/app/core/di/injectable.dart';
import 'package:doctor_hunt/app/core/utils/app_bloc_observer.dart';
import 'package:doctor_hunt/doctor_hunt_app.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: SupabaseConstants.supabaseUrl,
    publishableKey: SupabaseConstants.supabaseAnonKey,
  );

  Bloc.observer = const AppBlocObserver();

  await setupGetIt();

  LocaleSettings.useDeviceLocale();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    TranslationProvider(
      child: const DoctorHuntApp(),
    ),
  );
}
