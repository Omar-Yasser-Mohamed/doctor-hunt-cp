///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsAr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	@override dynamic operator[](String key) => _meta.getTranslation(key) ?? super[key];

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override String get appName => 'دكتور هانت';
	@override late final _Translations$common$ar common = _Translations$common$ar._(_root);
	@override late final _Translations$onboarding$ar onboarding = _Translations$onboarding$ar._(_root);
	@override late final _Translations$auth$ar auth = _Translations$auth$ar._(_root);
}

// Path: common
class _Translations$common$ar extends Translations$common$en {
	_Translations$common$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get kContinue => 'استمرار';
	@override String get cancel => 'إلغاء';
	@override String get save => 'حفظ';
	@override String get delete => 'حذف';
	@override String get retry => 'إعادة المحاولة';
	@override String get search => 'بحث';
	@override String get next => 'التالي';
	@override String get skip => 'تخطي';
}

// Path: onboarding
class _Translations$onboarding$ar extends Translations$onboarding$en {
	_Translations$onboarding$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get getStarted => 'ابدأ';
	@override String get findTrustedDoctors => 'العثور على أطباء موثوقين';
	@override String get findTrustedDoctorsDescription => 'بدلاً من الاعتقاد الشائع، فإن لوريم إيبسوم ليس مجرد نص عشوائي. بل له جذور في قطعة من الفلسفة الكلاسيكية تعود إلى أكثر من ٢٠٠٠ عام.';
	@override String get chooseBestDoctors => 'اختر أفضل الأطباء';
	@override String get chooseBestDoctorsDescription => 'بدلاً من الاعتقاد الشائع، فإن لوريم إيبسوم ليس مجرد نص عشوائي. بل له جذور في قطعة من الفلسفة الكلاسيكية تعود إلى أكثر من ٢٠٠٠ عام.';
	@override String get easyAppointments => 'حجز المواعيد بسهولة';
	@override String get easyAppointmentsDescription => 'بدلاً من الاعتقاد الشائع، فإن لوريم إيبسوم ليس مجرد نص عشوائي. بل له جذور في قطعة من الفلسفة الكلاسيكية تعود إلى أكثر من ٢٠٠٠ عام..';
}

// Path: auth
class _Translations$auth$ar extends Translations$auth$en {
	_Translations$auth$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get login => 'تسجيل الدخول';
	@override String get register => 'إنشاء حساب';
	@override String get email => 'البريد الإلكتروني';
	@override String get password => 'كلمة المرور';
	@override String get forgotPassword => 'هل نسيت كلمة المرور؟';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appName' => 'دكتور هانت',
			'common.kContinue' => 'استمرار',
			'common.cancel' => 'إلغاء',
			'common.save' => 'حفظ',
			'common.delete' => 'حذف',
			'common.retry' => 'إعادة المحاولة',
			'common.search' => 'بحث',
			'common.next' => 'التالي',
			'common.skip' => 'تخطي',
			'onboarding.getStarted' => 'ابدأ',
			'onboarding.findTrustedDoctors' => 'العثور على أطباء موثوقين',
			'onboarding.findTrustedDoctorsDescription' => 'بدلاً من الاعتقاد الشائع، فإن لوريم إيبسوم ليس مجرد نص عشوائي. بل له جذور في قطعة من الفلسفة الكلاسيكية تعود إلى أكثر من ٢٠٠٠ عام.',
			'onboarding.chooseBestDoctors' => 'اختر أفضل الأطباء',
			'onboarding.chooseBestDoctorsDescription' => 'بدلاً من الاعتقاد الشائع، فإن لوريم إيبسوم ليس مجرد نص عشوائي. بل له جذور في قطعة من الفلسفة الكلاسيكية تعود إلى أكثر من ٢٠٠٠ عام.',
			'onboarding.easyAppointments' => 'حجز المواعيد بسهولة',
			'onboarding.easyAppointmentsDescription' => 'بدلاً من الاعتقاد الشائع، فإن لوريم إيبسوم ليس مجرد نص عشوائي. بل له جذور في قطعة من الفلسفة الكلاسيكية تعود إلى أكثر من ٢٠٠٠ عام..',
			'auth.login' => 'تسجيل الدخول',
			'auth.register' => 'إنشاء حساب',
			'auth.email' => 'البريد الإلكتروني',
			'auth.password' => 'كلمة المرور',
			'auth.forgotPassword' => 'هل نسيت كلمة المرور؟',
			_ => null,
		};
	}
}
