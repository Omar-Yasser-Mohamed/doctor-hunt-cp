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
	@override late final _Translations$chooseRole$ar chooseRole = _Translations$chooseRole$ar._(_root);
	@override late final _Translations$auth$ar auth = _Translations$auth$ar._(_root);
	@override late final _Translations$validations$ar validations = _Translations$validations$ar._(_root);
}

// Path: common
class _Translations$common$ar extends Translations$common$en {
	_Translations$common$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get patient => 'مريض';
	@override String get admin => 'مدير';
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

// Path: chooseRole
class _Translations$chooseRole$ar extends Translations$chooseRole$en {
	_Translations$chooseRole$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get chooseYourRole => 'اختر دورك';
	@override String get chooseYourRoleDescription => 'الدور المحدد يحدد التجربة والميزات المتاحة.';
	@override String get patientDescription => 'ابحث عن الأطباء، احجز المواعيد، وأدر سجلاتك الطبية.';
	@override String get adminDescription => 'إدارة الأطباء والمواعيد والمستخدمين والمنصة.';
}

// Path: auth
class _Translations$auth$ar extends Translations$auth$en {
	_Translations$auth$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get login => 'تسجيل الدخول';
	@override String get register => 'إنشاء حساب';
	@override String get name => 'الاسم';
	@override String get email => 'البريد الإلكتروني';
	@override String get password => 'كلمة المرور';
	@override String get forgotPassword => 'هل نسيت كلمة المرور';
	@override String get google => 'جوجل';
	@override String get facebook => 'فيسبوك';
	@override String get welcomeBack => 'مرحبا بعودتك';
	@override String get joinUsToStartSearching => 'انضم إلينا للبدء في البحث';
	@override String get youCanSearchCourseApplyCourseAndFindScholarshipForAbroadStudies => 'يمكنك البحث في الدورات، التقديم للدورات، والعثور على منح دراسية للدراسة في الخارج';
	@override String get dontHaveAnAccount => 'لا تمتلك حساب؟';
	@override String get joinUs => 'انضم إلينا';
	@override String get haveAnAccount => 'هل لديك حساب؟';
	@override String get logIn => 'تسجيل الدخول';
	@override String get agreeToTerms => 'أوافق على شروط الخدمة وسياسة الخصوصية';
	@override String get signUp => 'إنشاء حساب';
	@override String get forgotPasswordDescription => 'أدخل عنوان بريدك الإلكتروني المسجل. سنرسل لك رابط إعادة تعيين كلمة المرور.';
	@override String get enterDigitsCode => 'أدخل رمز التحقق المكون من ٤ أرقام';
	@override String get enterDigitsDescription => 'أدخل رمز التحقق المكون من ٤ أرقام الذي تلقيته على بريدك الإلكتروني.';
	@override String get resetPassword => 'إعادة تعيين كلمة المرور';
	@override String get newPassword => 'كلمة المرور الجديدة';
	@override String get reEnterPassword => 'أعد إدخال كلمة المرور';
	@override String get resetPasswordDescription => 'أدخل كلمة المرور الجديدة لحسابك.';
	@override String get updatePassword => 'تحديث كلمة المرور';
	@override String get code => 'الرمز';
}

// Path: validations
class _Translations$validations$ar extends Translations$validations$en {
	_Translations$validations$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String required({required Object fieldName}) => 'حقل ${fieldName} مطلوب';
	@override String get emailRequired => 'البريد الإلكتروني مطلوب';
	@override String get invalidEmail => 'يرجى إدخال بريد إلكتروني صالح';
	@override String get passwordRequired => 'كلمة المرور مطلوبة';
	@override String get passwordMinLength => 'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل';
	@override String get passwordRequiresUppercase => 'يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل';
	@override String get passwordRequiresLowercase => 'يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل';
	@override String get passwordRequiresNumber => 'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل';
	@override String get passwordRequiresSpecialCharacter => 'يجب أن تحتوي كلمة المرور على رمز خاص واحد على الأقل';
	@override String get nameRequired => 'الاسم مطلوب';
	@override String get nameMinLength => 'يجب أن يتكون الاسم من 3 أحرف على الأقل';
	@override String get confirmPasswordRequired => 'يجب إعادة إدخال كلمة المرور';
	@override String get passwordsDoNotMatch => 'يجب أن تتطابق كلمة المرور مع كلمة المرور المعاد إدخالها';
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
			'common.patient' => 'مريض',
			'common.admin' => 'مدير',
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
			'chooseRole.chooseYourRole' => 'اختر دورك',
			'chooseRole.chooseYourRoleDescription' => 'الدور المحدد يحدد التجربة والميزات المتاحة.',
			'chooseRole.patientDescription' => 'ابحث عن الأطباء، احجز المواعيد، وأدر سجلاتك الطبية.',
			'chooseRole.adminDescription' => 'إدارة الأطباء والمواعيد والمستخدمين والمنصة.',
			'auth.login' => 'تسجيل الدخول',
			'auth.register' => 'إنشاء حساب',
			'auth.name' => 'الاسم',
			'auth.email' => 'البريد الإلكتروني',
			'auth.password' => 'كلمة المرور',
			'auth.forgotPassword' => 'هل نسيت كلمة المرور',
			'auth.google' => 'جوجل',
			'auth.facebook' => 'فيسبوك',
			'auth.welcomeBack' => 'مرحبا بعودتك',
			'auth.joinUsToStartSearching' => 'انضم إلينا للبدء في البحث',
			'auth.youCanSearchCourseApplyCourseAndFindScholarshipForAbroadStudies' => 'يمكنك البحث في الدورات، التقديم للدورات، والعثور على منح دراسية للدراسة في الخارج',
			'auth.dontHaveAnAccount' => 'لا تمتلك حساب؟',
			'auth.joinUs' => 'انضم إلينا',
			'auth.haveAnAccount' => 'هل لديك حساب؟',
			'auth.logIn' => 'تسجيل الدخول',
			'auth.agreeToTerms' => 'أوافق على شروط الخدمة وسياسة الخصوصية',
			'auth.signUp' => 'إنشاء حساب',
			'auth.forgotPasswordDescription' => 'أدخل عنوان بريدك الإلكتروني المسجل. سنرسل لك رابط إعادة تعيين كلمة المرور.',
			'auth.enterDigitsCode' => 'أدخل رمز التحقق المكون من ٤ أرقام',
			'auth.enterDigitsDescription' => 'أدخل رمز التحقق المكون من ٤ أرقام الذي تلقيته على بريدك الإلكتروني.',
			'auth.resetPassword' => 'إعادة تعيين كلمة المرور',
			'auth.newPassword' => 'كلمة المرور الجديدة',
			'auth.reEnterPassword' => 'أعد إدخال كلمة المرور',
			'auth.resetPasswordDescription' => 'أدخل كلمة المرور الجديدة لحسابك.',
			'auth.updatePassword' => 'تحديث كلمة المرور',
			'auth.code' => 'الرمز',
			'validations.required' => ({required Object fieldName}) => 'حقل ${fieldName} مطلوب',
			'validations.emailRequired' => 'البريد الإلكتروني مطلوب',
			'validations.invalidEmail' => 'يرجى إدخال بريد إلكتروني صالح',
			'validations.passwordRequired' => 'كلمة المرور مطلوبة',
			'validations.passwordMinLength' => 'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل',
			'validations.passwordRequiresUppercase' => 'يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل',
			'validations.passwordRequiresLowercase' => 'يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل',
			'validations.passwordRequiresNumber' => 'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل',
			'validations.passwordRequiresSpecialCharacter' => 'يجب أن تحتوي كلمة المرور على رمز خاص واحد على الأقل',
			'validations.nameRequired' => 'الاسم مطلوب',
			'validations.nameMinLength' => 'يجب أن يتكون الاسم من 3 أحرف على الأقل',
			'validations.confirmPasswordRequired' => 'يجب إعادة إدخال كلمة المرور',
			'validations.passwordsDoNotMatch' => 'يجب أن تتطابق كلمة المرور مع كلمة المرور المعاد إدخالها',
			_ => null,
		};
	}
}
