import 'package:doctor_hunt/doctor_hunt_app.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  LocaleSettings.useDeviceLocale();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ),
  );

  runApp(
    TranslationProvider(
      child: const DoctorHuntApp(),
    ),
  );
}
