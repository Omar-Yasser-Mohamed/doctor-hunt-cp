part of 'locale_bloc.dart';

sealed class LocaleState extends Equatable {
  final AppLocale locale;

  const LocaleState(this.locale);

  @override
  List<Object?> get props => [locale];
}

final class LocaleInitial extends LocaleState {
  const LocaleInitial() : super(AppLocale.en);
}

final class LocaleUpdated extends LocaleState {
  const LocaleUpdated(super.locale);
}
