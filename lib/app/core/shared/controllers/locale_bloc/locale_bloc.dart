import 'package:doctor_hunt/app/core/constants/hive_constants.dart';
import 'package:doctor_hunt/app/core/shared/services/storage_service.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'locale_event.dart';
part 'locale_state.dart';

@lazySingleton
class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  final StorageService _storageService;

  LocaleBloc(this._storageService) : super(const LocaleInitial()) {
    on<GetInitialLocaleEvent>(_onGetInitialLocale);
    on<ChangeLocaleEvent>(_onChangeLocale);
  }

  Future<void> _onGetInitialLocale(
    GetInitialLocaleEvent event,
    Emitter<LocaleState> emit,
  ) async {
    final savedCode = _storageService.getString(
      HiveConstants.localeKey,
    );

    final locale = switch (savedCode) {
      'ar' => AppLocale.ar,
      'en' => AppLocale.en,
      _ => AppLocale.en,
    };

    await LocaleSettings.setLocale(locale);
    emit(LocaleUpdated(locale));
  }

  Future<void> _onChangeLocale(
    ChangeLocaleEvent event,
    Emitter<LocaleState> emit,
  ) async {
    if (state.locale == event.locale) return;

    await _storageService.saveString(
      HiveConstants.localeKey,
      event.locale.languageCode,
    );

    await LocaleSettings.setLocale(event.locale);

    emit(LocaleUpdated(event.locale));
  }
}