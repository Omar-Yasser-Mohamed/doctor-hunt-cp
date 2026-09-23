///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsAr with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	@override dynamic operator[](String key) => _meta.getTranslation(key);

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override String get appName => 'دكتور هانت';
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
	@override String get live => 'مباشر';
	@override String get hour => 'ساعة';
	@override String get bookNow => 'احجز الآن';
	@override String get confirm => 'تأكيد';
	@override String get or => 'أو';
	@override String get done => 'تم';
	@override String get getStarted => 'ابدأ';
	@override String get findTrustedDoctors => 'العثور على أطباء موثوقين';
	@override String get findTrustedDoctorsDescription => 'بدلاً من الاعتقاد الشائع، فإن لوريم إيبسوم ليس مجرد نص عشوائي. بل له جذور في قطعة من الفلسفة الكلاسيكية تعود إلى أكثر من ٢٠٠٠ عام.';
	@override String get chooseBestDoctors => 'اختر أفضل الأطباء';
	@override String get chooseBestDoctorsDescription => 'بدلاً من الاعتقاد الشائع، فإن لوريم إيبسوم ليس مجرد نص عشوائي. بل له جذور في قطعة من الفلسفة الكلاسيكية تعود إلى أكثر من ٢٠٠٠ عام.';
	@override String get easyAppointments => 'حجز المواعيد بسهولة';
	@override String get easyAppointmentsDescription => 'بدلاً من الاعتقاد الشائع، فإن لوريم إيبسوم ليس مجرد نص عشوائي. بل له جذور في قطعة من الفلسفة الكلاسيكية تعود إلى أكثر من ٢٠٠٠ عام..';
	@override String get chooseYourRole => 'اختر دورك';
	@override String get chooseYourRoleDescription => 'الدور المحدد يحدد التجربة والميزات المتاحة.';
	@override String get patientDescription => 'ابحث عن الأطباء، احجز المواعيد، وأدر سجلاتك الطبية.';
	@override String get adminDescription => 'إدارة الأطباء والمواعيد والمستخدمين والمنصة.';
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
	@override String get forgotPasswordDescription => 'أدخل عنوان بريدك الإلكتروني المسجل. سنرسل لك رمز التحقق المكون من ٦ أرقام.';
	@override String get enterDigitsCode => 'أدخل رمز التحقق المكون من ٦ أرقام';
	@override String get enterDigitsDescription => 'أدخل رمز التحقق المكون من ٦ أرقام الذي تلقيته على بريدك الإلكتروني.';
	@override String get resetPassword => 'إعادة تعيين كلمة المرور';
	@override String get newPassword => 'كلمة المرور الجديدة';
	@override String get reEnterPassword => 'أعد إدخال كلمة المرور';
	@override String get resetPasswordDescription => 'أدخل كلمة المرور الجديدة لحسابك.';
	@override String get updatePassword => 'تحديث كلمة المرور';
	@override String get code => 'الرمز';
	@override late final _Translations$validations$ar validations = _Translations$validations$ar._(_root);
	@override String hi({required Object name}) => 'مرحبا ${name}!';
	@override String get findYourDoctor => 'ابحث عن طبيبك';
	@override String get seeAll => 'عرض الكل';
	@override String get liveDoctors => 'أطباء مباشرون';
	@override String get popularDoctor => 'أطباء مشهورون';
	@override String get featureDoctor => 'أطباء مميزون';
	@override String get doctorDetails => 'تفاصيل الطبيب';
	@override String get runing => 'مباشر';
	@override String get ongoing => 'مستمر';
	@override String get services => 'الخدمات';
	@override String get findDoctors => 'ابحث عن طبيبك';
	@override String get nextAvailable => 'التالي المتاح';
	@override String get tomorrow => 'غدا';
	@override String get yearsExperience => 'سنوات الخبرة';
	@override String get patientStories => 'قصص المرضى';
	@override String get appointment => 'موعد';
	@override String get availableTime => 'الوقت المتاح';
	@override String get reminderMeBefore => 'تذكيري قبل الموعد';
	@override String get minit => 'دقيقة';
	@override String get noSlotsAvailable => 'لا توجد أوقات متاحة';
	@override String get nextAvailabilityOn => 'التوفر التالي في';
	@override String get contactClinic => 'اتصل بالعيادة';
	@override String get appointmentSuccessful => 'تم حجز موعدك بنجاح';
	@override String get thankYou => 'شكرا لك !';
	@override String appointmentSuccessfulDescription({required Object doctorName, required Object date, required Object time}) => 'لقد حجزت موعدًا مع الدكتور ${doctorName} في ${date}، الساعة ${time}';
	@override String get editYourAppointment => 'تعديل الموعد الخاص بك';
}

// Path: validations
class _Translations$validations$ar implements Translations$validations$en {
	_Translations$validations$ar._(this._root);

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
			'patient' => 'مريض',
			'admin' => 'مدير',
			'kContinue' => 'استمرار',
			'cancel' => 'إلغاء',
			'save' => 'حفظ',
			'delete' => 'حذف',
			'retry' => 'إعادة المحاولة',
			'search' => 'بحث',
			'next' => 'التالي',
			'skip' => 'تخطي',
			'live' => 'مباشر',
			'hour' => 'ساعة',
			'bookNow' => 'احجز الآن',
			'confirm' => 'تأكيد',
			'or' => 'أو',
			'done' => 'تم',
			'getStarted' => 'ابدأ',
			'findTrustedDoctors' => 'العثور على أطباء موثوقين',
			'findTrustedDoctorsDescription' => 'بدلاً من الاعتقاد الشائع، فإن لوريم إيبسوم ليس مجرد نص عشوائي. بل له جذور في قطعة من الفلسفة الكلاسيكية تعود إلى أكثر من ٢٠٠٠ عام.',
			'chooseBestDoctors' => 'اختر أفضل الأطباء',
			'chooseBestDoctorsDescription' => 'بدلاً من الاعتقاد الشائع، فإن لوريم إيبسوم ليس مجرد نص عشوائي. بل له جذور في قطعة من الفلسفة الكلاسيكية تعود إلى أكثر من ٢٠٠٠ عام.',
			'easyAppointments' => 'حجز المواعيد بسهولة',
			'easyAppointmentsDescription' => 'بدلاً من الاعتقاد الشائع، فإن لوريم إيبسوم ليس مجرد نص عشوائي. بل له جذور في قطعة من الفلسفة الكلاسيكية تعود إلى أكثر من ٢٠٠٠ عام..',
			'chooseYourRole' => 'اختر دورك',
			'chooseYourRoleDescription' => 'الدور المحدد يحدد التجربة والميزات المتاحة.',
			'patientDescription' => 'ابحث عن الأطباء، احجز المواعيد، وأدر سجلاتك الطبية.',
			'adminDescription' => 'إدارة الأطباء والمواعيد والمستخدمين والمنصة.',
			'login' => 'تسجيل الدخول',
			'register' => 'إنشاء حساب',
			'name' => 'الاسم',
			'email' => 'البريد الإلكتروني',
			'password' => 'كلمة المرور',
			'forgotPassword' => 'هل نسيت كلمة المرور',
			'google' => 'جوجل',
			'facebook' => 'فيسبوك',
			'welcomeBack' => 'مرحبا بعودتك',
			'joinUsToStartSearching' => 'انضم إلينا للبدء في البحث',
			'youCanSearchCourseApplyCourseAndFindScholarshipForAbroadStudies' => 'يمكنك البحث في الدورات، التقديم للدورات، والعثور على منح دراسية للدراسة في الخارج',
			'dontHaveAnAccount' => 'لا تمتلك حساب؟',
			'joinUs' => 'انضم إلينا',
			'haveAnAccount' => 'هل لديك حساب؟',
			'logIn' => 'تسجيل الدخول',
			'agreeToTerms' => 'أوافق على شروط الخدمة وسياسة الخصوصية',
			'signUp' => 'إنشاء حساب',
			'forgotPasswordDescription' => 'أدخل عنوان بريدك الإلكتروني المسجل. سنرسل لك رمز التحقق المكون من ٦ أرقام.',
			'enterDigitsCode' => 'أدخل رمز التحقق المكون من ٦ أرقام',
			'enterDigitsDescription' => 'أدخل رمز التحقق المكون من ٦ أرقام الذي تلقيته على بريدك الإلكتروني.',
			'resetPassword' => 'إعادة تعيين كلمة المرور',
			'newPassword' => 'كلمة المرور الجديدة',
			'reEnterPassword' => 'أعد إدخال كلمة المرور',
			'resetPasswordDescription' => 'أدخل كلمة المرور الجديدة لحسابك.',
			'updatePassword' => 'تحديث كلمة المرور',
			'code' => 'الرمز',
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
			'hi' => ({required Object name}) => 'مرحبا ${name}!',
			'findYourDoctor' => 'ابحث عن طبيبك',
			'seeAll' => 'عرض الكل',
			'liveDoctors' => 'أطباء مباشرون',
			'popularDoctor' => 'أطباء مشهورون',
			'featureDoctor' => 'أطباء مميزون',
			'doctorDetails' => 'تفاصيل الطبيب',
			'runing' => 'مباشر',
			'ongoing' => 'مستمر',
			'services' => 'الخدمات',
			'findDoctors' => 'ابحث عن طبيبك',
			'nextAvailable' => 'التالي المتاح',
			'tomorrow' => 'غدا',
			'yearsExperience' => 'سنوات الخبرة',
			'patientStories' => 'قصص المرضى',
			'appointment' => 'موعد',
			'availableTime' => 'الوقت المتاح',
			'reminderMeBefore' => 'تذكيري قبل الموعد',
			'minit' => 'دقيقة',
			'noSlotsAvailable' => 'لا توجد أوقات متاحة',
			'nextAvailabilityOn' => 'التوفر التالي في',
			'contactClinic' => 'اتصل بالعيادة',
			'appointmentSuccessful' => 'تم حجز موعدك بنجاح',
			'thankYou' => 'شكرا لك !',
			'appointmentSuccessfulDescription' => ({required Object doctorName, required Object date, required Object time}) => 'لقد حجزت موعدًا مع الدكتور ${doctorName} في ${date}، الساعة ${time}',
			'editYourAppointment' => 'تعديل الموعد الخاص بك',
			_ => null,
		};
	}
}
