part of 'locale_bloc.dart';

sealed class LocaleEvent extends Equatable {
  const LocaleEvent();

  @override
  List<Object?> get props => [];
}

final class GetInitialLocaleEvent extends LocaleEvent {
  const GetInitialLocaleEvent();
}

final class ChangeLocaleEvent extends LocaleEvent {
  final AppLocale locale;

  const ChangeLocaleEvent(this.locale);

  @override
  List<Object?> get props => [locale];
}
