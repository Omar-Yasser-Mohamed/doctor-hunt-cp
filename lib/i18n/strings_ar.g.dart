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
	@override late final _Translations$errors$ar errors = _Translations$errors$ar._(_root);
	@override String get pickLocation => 'تحديد الموقع';
	@override String get searchPlaces => 'ابحث عن مكان...';
	@override String get confirmLocation => 'تأكيد الموقع';
	@override String get tapToSelectLocation => 'اضغط على الخريطة لتحديد الموقع';
	@override String get loading => 'جاري التحميل...';
	@override String hi({required Object name}) => 'مرحبا ${name}!';
	@override String get findYourDoctor => 'ابحث عن طبيبك';
	@override String get seeAll => 'عرض الكل';
	@override String get liveDoctors => 'أطباء مباشرون';
	@override String get popularDoctors => 'أطباء مشهورون';
	@override String get topRatedDoctors => 'الأطباء الأعلى تقييمًا';
	@override String get doctorDetails => 'تفاصيل الطبيب';
	@override String get runing => 'مباشر';
	@override String get ongoing => 'مستمر';
	@override String get services => 'الخدمات';
	@override String get doctorService1 => 'يجب أن تكون رعاية المريض هي الأولوية الأولى.';
	@override String get doctorService2 => 'إذا كنت تدير عيادتك، فأنت تعلم كم قد يكون الأمر محبطًا.';
	@override String get doctorService3 => 'لهذا السبب تم تصميم نظام تذكير المواعيد.';
	@override String get findDoctors => 'ابحث عن طبيبك';
	@override String get nextAvailable => 'التالي المتاح';
	@override String get tomorrow => 'غدا';
	@override String get yearsExperience => 'سنوات الخبرة';
	@override String get patientStories => 'قصص المرضى';
	@override String get appointment => 'موعد';
	@override String get availableTimes => 'المواعيد المتاحة';
	@override String get reminderMeBefore => 'تذكيري قبل الموعد';
	@override String get minit => 'دقيقة';
	@override String get noSlotsAvailable => 'لا توجد أوقات متاحة';
	@override String get nextAvailabilityOn => 'التوفر التالي في';
	@override String get contactClinic => 'اتصل بالعيادة';
	@override String get appointmentSuccessful => 'تم حجز موعدك بنجاح';
	@override String get thankYou => 'شكرا لك !';
	@override String appointmentSuccessfulDescription({required Object doctorName, required Object date, required Object time}) => 'لقد حجزت موعدًا مع ${doctorName} في ${date}، الساعة ${time}';
	@override String get editYourAppointment => 'تعديل الموعد الخاص بك';
	@override String get passwordResetSuccess => 'تم إعادة تعيين كلمة المرور بنجاح';
	@override String get doctors => 'الأطباء';
	@override String get settings => 'الإعدادات';
	@override String get appointments => 'المواعيد';
	@override String get addDoctor => 'إضافة طبيب';
	@override String get totalDoctors => 'إجمالي الأطباء';
	@override String get activeDoctors => 'الأطباء النشطين';
	@override String get searchDoctors => 'ابحث عن الأطباء...';
	@override String get active => 'نشط';
	@override String get inactive => 'غير نشط';
	@override String get reviews => 'التقييمات';
	@override String get dentist => 'طبيب أسنان';
	@override String get cardiologist => 'طبيب قلب';
	@override String get ophthalmologist => 'طبيب عيون';
	@override String get dermatologist => 'طبيب جلدية';
	@override String get all => 'الكل';
	@override String get noDoctorsFound => 'لا يوجد أطباء';
	@override String get noDoctorsFoundDescription => 'لا يوجد أطباء مسجلين في منصة دكتور هانت في الوقت الحالي. أضف طبيبك الأول للبدء.';
	@override String get specialty => 'التخصص';
	@override String get consultationFee => 'رسوم الاستشارة';
	@override String get rating => 'التقييم';
	@override String get editDoctor => 'تعديل الطبيب';
	@override String get manageAvailability => 'إدارة التوافر';
	@override String get createDoctor => 'إضافة طبيب';
	@override String get doctorName => 'اسم الطبيب';
	@override String get doctorNameHint => 'مثال: د. أحمد علي';
	@override String get selectSpecialty => 'اختر التخصص';
	@override String get consultationFeeHint => 'مثال: \$28.00';
	@override String get addPhoto => 'إضافة صورة';
	@override String get doctorCreatedSuccessfully => 'تم إضافة الطبيب بنجاح!';
	@override String get doctorCreatedSuccessfullyDescription => 'تمت إضافة ملف الطبيب إلى دكتور هانت.';
	@override String get takeAPhoto => 'التقاط صورة';
	@override String get fromGallery => 'من المعرض';
	@override String get pleaseSelectDoctorImage => 'يرجى اختيار صورة الطبيب';
	@override String get saveChanges => 'حفظ التغييرات';
	@override String get deleteDoctor => 'حذف الطبيب';
	@override String get deleteDoctorConfirmationTitle => 'حذف الطبيب؟';
	@override String get deleteDoctorConfirmationMessage => 'هل أنت متأكد من رغبتك في حذف هذا الطبيب؟ لا يمكن التراجع عن هذا الإجراء.';
	@override String get doctorStatus => 'حالة الطبيب';
	@override String get activeAndAvailable => 'نشط ومتاح';
	@override String get inactiveAndUnavailable => 'غير نشط وغير متاح';
	@override String get tapPhotoToChange => 'اضغط لتغيير الصورة';
	@override String get doctorUpdatedSuccessfully => 'تم تحديث بيانات الطبيب بنجاح!';
	@override String get doctorDeletedSuccessfully => 'تم حذف الطبيب بنجاح!';
	@override String get monday => 'الاثنين';
	@override String get tuesday => 'الثلاثاء';
	@override String get wednesday => 'الاربعاء';
	@override String get thursday => 'الخميس';
	@override String get friday => 'الجمعة';
	@override String get saturday => 'السبت';
	@override String get sunday => 'الاحد';
	@override String get doctorAvailability => 'مواعيد عمل الطبيب';
	@override String get workingDays => 'أيام العمل';
	@override String daysEnabled({required Object count}) => '${count} أيام مفعلة';
	@override String get workingHours => 'ساعات العمل';
	@override String get startTime => 'وقت البدء';
	@override String get endTime => 'وقت الانتهاء';
	@override String get slotDuration => 'مدة الكشف';
	@override String get saveAvailability => 'حفظ المواعيد';
	@override String get availabilityUpdatedSuccessfully => 'تم تحديث مواعيد عمل الطبيب بنجاح!';
	@override String get atLeastOneDayRequired => 'يجب اختيار يوم عمل واحد على الأقل';
	@override String get startTimeMustBeBeforeEndTime => 'يجب أن يكون وقت البدء قبل وقت الانتهاء';
	@override String minutesDuration({required Object minutes}) => '${minutes} دقيقة';
	@override String get slotDurationMustBeGreaterThanZero => 'يجب أن تكون مدة الكشف أكبر من صفر';
	@override String get slotDurationMustBeBeforeEndTime => 'يجب أن تكون مدة الكشف قبل وقت الانتهاء';
	@override String get atLeastOneWorkingDayMustBeSelected => 'يجب اختيار يوم عمل واحد على الأقل';
	@override String get adminProfile => 'الملف الشخصي للمشرف';
	@override String get adminProfileSubtitle => 'تعديل تفاصيل وصلاحيات المشرف الرئيسي';
	@override String get changePassword => 'تغيير كلمة المرور';
	@override String get changePasswordSubtitle => 'تحديث بيانات الأمان الرئيسية';
	@override String get appInformation => 'معلومات التطبيق';
	@override String get buildVersion => 'إصدار التطبيق';
	@override String get logout => 'تسجيل الخروج';
	@override String get logOut => 'تسجيل الخروج';
	@override String get editProfile => 'تعديل الملف الشخصي';
	@override String get fullName => 'الاسم بالكامل';
	@override String get emailAddress => 'البريد الإلكتروني';
	@override String get clinicLocation => 'موقع العيادة';
	@override String get ok => 'موافق';
	@override String get logoutConfirmationMessage => 'هل أنت متأكد من رغبتك في تسجيل الخروج؟';
	@override String get home => 'الرئيسية';
	@override String get favorites => 'المفضلة';
	@override String get myAppointments => 'المواعيد الخاصة بي';
	@override String get Specialist => 'أخصائي';
	@override String get noDoctorsSearchDescription => 'لم نتمكن من العثور على أي أطباء يطابقون بحثك. حاول البحث باسم أو تخصص آخر.';
	@override String get startSearchTitle => 'ابحث عن طبيبك';
	@override String get startSearchDescription => 'ابحث بالاسم للعثور على الطبيب المناسب لك.';
	@override String get noSearchResultsDescription => 'لم يتم العثور على نتائج. جرّب اسمًا آخر.';
	@override String get profileUpdatedSuccessfully => 'تم تحديث الملف الشخصي بنجاح!';
	@override String get accountSettings => 'إعدادات الحساب';
	@override String get notifications => 'الإشعارات';
	@override String get privacyPolicy => 'سياسة الخصوصية';
	@override String get moreOptions => 'المزيد من الخيارات';
	@override String get languages => 'اللغات';
	@override String get doctorHuntPrivacyPolicyTitle => 'سياسة الخصوصية لتطبيقات Doctor Hunt';
	@override String get privacyPolicyIntro => 'هناك العديد من الأشكال المختلفة لنصوص لوريم إيبسوم المتاحة، ولكن غالبيتها خضعت للتعديل بشكل ما، عن طريق إدخال روح الدعابة أو كلمات عشوائية مقبولة. إنها حقيقة مثبتة منذ زمن طويل أن القارئ سيتشتت انتباهه بالمحتوى المقروء للصفحة عند النظر إلى تصميمها.';
	@override String get privacyPolicyPoint1 => 'تمت إعادة إنتاج الجزء القياسي من لوريم إيبسوم المستخدم منذ القرن السادس عشر أدناه للمهتمين بذلك.';
	@override String get privacyPolicyPoint2 => 'الأقسام 1.10.32 و 1.10.33 من كتاب "عن أقصى درجات الخير والشر". الغرض من الاستخدام.';
	@override String get privacyPolicyPoint3 => 'حقيقة مثبتة منذ زمن طويل أن القارئ سيتشتت انتباهه بالمحتوى المقروء للصفحة.';
	@override String get privacyPolicyPoint4 => 'الهدف من استخدام لوريم إيبسوم هو توفير نص يشبه النص الطبيعي دون تشتيت الانتباه.';
	@override String get privacyPolicyOutro => 'إنها حقيقة مثبتة منذ وقت طويل أن القارئ سيتشتت بالمحتوى المقروء للصفحة عند النظر إلى تصميمها العام.';
	@override String get profile => 'الملف الشخصي';
	@override String get personalInformation => 'المعلومات الشخصية';
	@override String get continueButton => 'متابعة';
	@override String get favouriteDoctors => 'الأطباء المفضلين';
	@override String get upcoming => 'القادم';
	@override String get completed => 'اكتمل';
	@override String get cancelled => 'ألغيت';
	@override String get pleaseSelectAnAppointmentSlot => 'يرجى اختيار موعد';
	@override String get selectLanguage => 'اختر اللغة';
	@override String get choosePreferredLanguage => 'اختر لغتك المفضلة';
	@override String get arabic => 'العربية';
	@override String get english => 'English';
	@override String get arabicSubtitle => 'العربية';
	@override String get englishSubtitle => 'الإنجليزية';
	@override String get noFavoriteDoctors => 'لا يوجد أطباء مفضلين';
	@override String get noFavoriteDoctorsDescription => 'لم تقم بإضافة أي أطباء مفضلين بعد.';
	@override String get appointmentDate => 'تاريخ الموعد';
	@override String get appointmentTime => 'وقت الموعد';
	@override String get viewDetails => 'عرض التفاصيل';
	@override String get cancelAppointment => 'إلغاء الموعد';
	@override String get tapToRateYourVisit => 'اضغط لتقييم زيارتك';
	@override String get rateDoctor => 'تقييم الطبيب';
	@override String get noAppointmentsYet => 'لا يوجد مواعيد';
	@override String get youHaventBookedAnyAppointmentsYet => 'لم تحجز أي مواعيد حتى الآن';
	@override String get noAppointmentsFound => 'لا يوجد مواعيد';
	@override String get noAppointmentsDescription => 'لا يوجد مواعيد مجدولة حالياً. تحقق لاحقاً من وجود تحديثات';
	@override String get date => 'التاريخ';
	@override String get time => 'الوقت';
	@override String get fee => 'الرسوم';
	@override String get markAsCompleted => 'تحديد كمكتمل';
	@override String get appointmentDetails => 'تفاصيل الموعد';
	@override String get doctor => 'الطبيب';
	@override String get yesCancel => 'نعم، إلغاء';
	@override String get cancelAppointmentConfirmation => 'هل أنت متأكد من رغبتك في إلغاء هذا الموعد؟';
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
	@override String greaterThanZero({required Object fieldName}) => 'يجب أن تكون قيمة ${fieldName} أكبر من 0';
}

// Path: errors
class _Translations$errors$ar implements Translations$errors$en {
	_Translations$errors$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get unknown => 'حدث خطأ ما، حاول مرة أخرى.';
	@override String get network => 'لا يوجد إنترنت، حاول مرة أخرى.';
	@override String get timeout => 'انتهت مهلة الطلب، حاول مرة أخرى.';
	@override String get badRequest => 'طلب غير صالح، حاول مرة أخرى.';
	@override String get unauthorized => 'يرجى تسجيل الدخول والمحاولة مرة أخرى.';
	@override String get forbidden => 'ليس لديك صلاحية للقيام بذلك.';
	@override String get notFound => 'العنصر المطلوب غير موجود.';
	@override String get conflict => 'تعذر إتمام هذا الإجراء.';
	@override String get tooManyRequests => 'محاولات كثيرة، حاول مرة أخرى لاحقًا.';
	@override String get serverError => 'حدث خطأ ما، حاول مرة أخرى.';
	@override String get serviceUnavailable => 'الخدمة غير متاحة، حاول مرة أخرى لاحقًا.';
	@override String get invalidCredentials => 'البريد الإلكتروني أو كلمة المرور غير صحيحة.';
	@override String get emailAlreadyExists => 'البريد الإلكتروني مستخدم بالفعل.';
	@override String get emailNotConfirmed => 'يرجى تأكيد البريد الإلكتروني.';
	@override String get weakPassword => 'كلمة المرور ضعيفة.';
	@override String get userNotFound => 'الحساب غير موجود.';
	@override String get sessionExpired => 'انتهت الجلسة، يرجى تسجيل الدخول مرة أخرى.';
	@override String get otpExpired => 'انتهت صلاحية الكود، حاول مرة أخرى.';
	@override String get databaseError => 'حدث خطأ ما، حاول مرة أخرى.';
	@override String get permissionDenied => 'ليس لديك صلاحية للقيام بذلك.';
	@override String get googleSignInFailed => 'فشل تسجيل الدخول، حاول مرة أخرى.';
	@override String get invalidRole => 'الدور غير صحيح، يرجى تسجيل الدخول مرة أخرى';
	@override String get samePassword => 'كلمة المرور الجديدة نفس كلمة المرور القديمة';
	@override String get imagePickerFailed => 'فشل اختيار الصورة، حاول مرة أخرى.';
	@override String get locationPermissionDenied => 'تم رفض إذن الموقع، يرجى السماح بالوصول.';
	@override String get locationPermissionPermanentlyDenied => 'تم رفض إذن الموقع نهائياً. يرجى تفعيله من الإعدادات.';
	@override String get locationServiceDisabled => 'خدمات الموقع غير مفعلة في جهازك.';
	@override String get geocodingFailed => 'تعذر العثور على عنوان لهذا الموقع.';
	@override String get slotUnavailable => 'الموعد ده لم يعد متاحًا.';
	@override String get doctorUnavailable => 'الدكتور غير متاح حاليًا.';
	@override String get invalidAppointmentTime => 'من فضلك اختار موعدًا صحيحًا.';
	@override String get appointmentCouldNotBeCancelled => 'تعذر إلغاء الموعد، يرجى المحاولة مرة أخرى.';
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
			'validations.greaterThanZero' => ({required Object fieldName}) => 'يجب أن تكون قيمة ${fieldName} أكبر من 0',
			'errors.unknown' => 'حدث خطأ ما، حاول مرة أخرى.',
			'errors.network' => 'لا يوجد إنترنت، حاول مرة أخرى.',
			'errors.timeout' => 'انتهت مهلة الطلب، حاول مرة أخرى.',
			'errors.badRequest' => 'طلب غير صالح، حاول مرة أخرى.',
			'errors.unauthorized' => 'يرجى تسجيل الدخول والمحاولة مرة أخرى.',
			'errors.forbidden' => 'ليس لديك صلاحية للقيام بذلك.',
			'errors.notFound' => 'العنصر المطلوب غير موجود.',
			'errors.conflict' => 'تعذر إتمام هذا الإجراء.',
			'errors.tooManyRequests' => 'محاولات كثيرة، حاول مرة أخرى لاحقًا.',
			'errors.serverError' => 'حدث خطأ ما، حاول مرة أخرى.',
			'errors.serviceUnavailable' => 'الخدمة غير متاحة، حاول مرة أخرى لاحقًا.',
			'errors.invalidCredentials' => 'البريد الإلكتروني أو كلمة المرور غير صحيحة.',
			'errors.emailAlreadyExists' => 'البريد الإلكتروني مستخدم بالفعل.',
			'errors.emailNotConfirmed' => 'يرجى تأكيد البريد الإلكتروني.',
			'errors.weakPassword' => 'كلمة المرور ضعيفة.',
			'errors.userNotFound' => 'الحساب غير موجود.',
			'errors.sessionExpired' => 'انتهت الجلسة، يرجى تسجيل الدخول مرة أخرى.',
			'errors.otpExpired' => 'انتهت صلاحية الكود، حاول مرة أخرى.',
			'errors.databaseError' => 'حدث خطأ ما، حاول مرة أخرى.',
			'errors.permissionDenied' => 'ليس لديك صلاحية للقيام بذلك.',
			'errors.googleSignInFailed' => 'فشل تسجيل الدخول، حاول مرة أخرى.',
			'errors.invalidRole' => 'الدور غير صحيح، يرجى تسجيل الدخول مرة أخرى',
			'errors.samePassword' => 'كلمة المرور الجديدة نفس كلمة المرور القديمة',
			'errors.imagePickerFailed' => 'فشل اختيار الصورة، حاول مرة أخرى.',
			'errors.locationPermissionDenied' => 'تم رفض إذن الموقع، يرجى السماح بالوصول.',
			'errors.locationPermissionPermanentlyDenied' => 'تم رفض إذن الموقع نهائياً. يرجى تفعيله من الإعدادات.',
			'errors.locationServiceDisabled' => 'خدمات الموقع غير مفعلة في جهازك.',
			'errors.geocodingFailed' => 'تعذر العثور على عنوان لهذا الموقع.',
			'errors.slotUnavailable' => 'الموعد ده لم يعد متاحًا.',
			'errors.doctorUnavailable' => 'الدكتور غير متاح حاليًا.',
			'errors.invalidAppointmentTime' => 'من فضلك اختار موعدًا صحيحًا.',
			'errors.appointmentCouldNotBeCancelled' => 'تعذر إلغاء الموعد، يرجى المحاولة مرة أخرى.',
			'pickLocation' => 'تحديد الموقع',
			'searchPlaces' => 'ابحث عن مكان...',
			'confirmLocation' => 'تأكيد الموقع',
			'tapToSelectLocation' => 'اضغط على الخريطة لتحديد الموقع',
			'loading' => 'جاري التحميل...',
			'hi' => ({required Object name}) => 'مرحبا ${name}!',
			'findYourDoctor' => 'ابحث عن طبيبك',
			'seeAll' => 'عرض الكل',
			'liveDoctors' => 'أطباء مباشرون',
			'popularDoctors' => 'أطباء مشهورون',
			'topRatedDoctors' => 'الأطباء الأعلى تقييمًا',
			'doctorDetails' => 'تفاصيل الطبيب',
			'runing' => 'مباشر',
			'ongoing' => 'مستمر',
			'services' => 'الخدمات',
			'doctorService1' => 'يجب أن تكون رعاية المريض هي الأولوية الأولى.',
			'doctorService2' => 'إذا كنت تدير عيادتك، فأنت تعلم كم قد يكون الأمر محبطًا.',
			'doctorService3' => 'لهذا السبب تم تصميم نظام تذكير المواعيد.',
			'findDoctors' => 'ابحث عن طبيبك',
			'nextAvailable' => 'التالي المتاح',
			'tomorrow' => 'غدا',
			'yearsExperience' => 'سنوات الخبرة',
			'patientStories' => 'قصص المرضى',
			'appointment' => 'موعد',
			'availableTimes' => 'المواعيد المتاحة',
			'reminderMeBefore' => 'تذكيري قبل الموعد',
			'minit' => 'دقيقة',
			'noSlotsAvailable' => 'لا توجد أوقات متاحة',
			'nextAvailabilityOn' => 'التوفر التالي في',
			'contactClinic' => 'اتصل بالعيادة',
			'appointmentSuccessful' => 'تم حجز موعدك بنجاح',
			'thankYou' => 'شكرا لك !',
			'appointmentSuccessfulDescription' => ({required Object doctorName, required Object date, required Object time}) => 'لقد حجزت موعدًا مع ${doctorName} في ${date}، الساعة ${time}',
			'editYourAppointment' => 'تعديل الموعد الخاص بك',
			'passwordResetSuccess' => 'تم إعادة تعيين كلمة المرور بنجاح',
			'doctors' => 'الأطباء',
			'settings' => 'الإعدادات',
			'appointments' => 'المواعيد',
			'addDoctor' => 'إضافة طبيب',
			'totalDoctors' => 'إجمالي الأطباء',
			'activeDoctors' => 'الأطباء النشطين',
			'searchDoctors' => 'ابحث عن الأطباء...',
			'active' => 'نشط',
			'inactive' => 'غير نشط',
			'reviews' => 'التقييمات',
			'dentist' => 'طبيب أسنان',
			'cardiologist' => 'طبيب قلب',
			'ophthalmologist' => 'طبيب عيون',
			'dermatologist' => 'طبيب جلدية',
			'all' => 'الكل',
			'noDoctorsFound' => 'لا يوجد أطباء',
			'noDoctorsFoundDescription' => 'لا يوجد أطباء مسجلين في منصة دكتور هانت في الوقت الحالي. أضف طبيبك الأول للبدء.',
			'specialty' => 'التخصص',
			'consultationFee' => 'رسوم الاستشارة',
			'rating' => 'التقييم',
			'editDoctor' => 'تعديل الطبيب',
			'manageAvailability' => 'إدارة التوافر',
			'createDoctor' => 'إضافة طبيب',
			'doctorName' => 'اسم الطبيب',
			'doctorNameHint' => 'مثال: د. أحمد علي',
			'selectSpecialty' => 'اختر التخصص',
			'consultationFeeHint' => 'مثال: \$28.00',
			'addPhoto' => 'إضافة صورة',
			'doctorCreatedSuccessfully' => 'تم إضافة الطبيب بنجاح!',
			'doctorCreatedSuccessfullyDescription' => 'تمت إضافة ملف الطبيب إلى دكتور هانت.',
			'takeAPhoto' => 'التقاط صورة',
			'fromGallery' => 'من المعرض',
			'pleaseSelectDoctorImage' => 'يرجى اختيار صورة الطبيب',
			'saveChanges' => 'حفظ التغييرات',
			'deleteDoctor' => 'حذف الطبيب',
			'deleteDoctorConfirmationTitle' => 'حذف الطبيب؟',
			'deleteDoctorConfirmationMessage' => 'هل أنت متأكد من رغبتك في حذف هذا الطبيب؟ لا يمكن التراجع عن هذا الإجراء.',
			'doctorStatus' => 'حالة الطبيب',
			'activeAndAvailable' => 'نشط ومتاح',
			'inactiveAndUnavailable' => 'غير نشط وغير متاح',
			'tapPhotoToChange' => 'اضغط لتغيير الصورة',
			'doctorUpdatedSuccessfully' => 'تم تحديث بيانات الطبيب بنجاح!',
			'doctorDeletedSuccessfully' => 'تم حذف الطبيب بنجاح!',
			'monday' => 'الاثنين',
			'tuesday' => 'الثلاثاء',
			'wednesday' => 'الاربعاء',
			'thursday' => 'الخميس',
			'friday' => 'الجمعة',
			'saturday' => 'السبت',
			'sunday' => 'الاحد',
			'doctorAvailability' => 'مواعيد عمل الطبيب',
			'workingDays' => 'أيام العمل',
			'daysEnabled' => ({required Object count}) => '${count} أيام مفعلة',
			'workingHours' => 'ساعات العمل',
			'startTime' => 'وقت البدء',
			'endTime' => 'وقت الانتهاء',
			'slotDuration' => 'مدة الكشف',
			'saveAvailability' => 'حفظ المواعيد',
			'availabilityUpdatedSuccessfully' => 'تم تحديث مواعيد عمل الطبيب بنجاح!',
			'atLeastOneDayRequired' => 'يجب اختيار يوم عمل واحد على الأقل',
			'startTimeMustBeBeforeEndTime' => 'يجب أن يكون وقت البدء قبل وقت الانتهاء',
			'minutesDuration' => ({required Object minutes}) => '${minutes} دقيقة',
			'slotDurationMustBeGreaterThanZero' => 'يجب أن تكون مدة الكشف أكبر من صفر',
			'slotDurationMustBeBeforeEndTime' => 'يجب أن تكون مدة الكشف قبل وقت الانتهاء',
			'atLeastOneWorkingDayMustBeSelected' => 'يجب اختيار يوم عمل واحد على الأقل',
			'adminProfile' => 'الملف الشخصي للمشرف',
			'adminProfileSubtitle' => 'تعديل تفاصيل وصلاحيات المشرف الرئيسي',
			'changePassword' => 'تغيير كلمة المرور',
			'changePasswordSubtitle' => 'تحديث بيانات الأمان الرئيسية',
			'appInformation' => 'معلومات التطبيق',
			'buildVersion' => 'إصدار التطبيق',
			'logout' => 'تسجيل الخروج',
			'logOut' => 'تسجيل الخروج',
			'editProfile' => 'تعديل الملف الشخصي',
			'fullName' => 'الاسم بالكامل',
			'emailAddress' => 'البريد الإلكتروني',
			'clinicLocation' => 'موقع العيادة',
			'ok' => 'موافق',
			'logoutConfirmationMessage' => 'هل أنت متأكد من رغبتك في تسجيل الخروج؟',
			'home' => 'الرئيسية',
			'favorites' => 'المفضلة',
			'myAppointments' => 'المواعيد الخاصة بي',
			'Specialist' => 'أخصائي',
			'noDoctorsSearchDescription' => 'لم نتمكن من العثور على أي أطباء يطابقون بحثك. حاول البحث باسم أو تخصص آخر.',
			'startSearchTitle' => 'ابحث عن طبيبك',
			'startSearchDescription' => 'ابحث بالاسم للعثور على الطبيب المناسب لك.',
			'noSearchResultsDescription' => 'لم يتم العثور على نتائج. جرّب اسمًا آخر.',
			'profileUpdatedSuccessfully' => 'تم تحديث الملف الشخصي بنجاح!',
			'accountSettings' => 'إعدادات الحساب',
			'notifications' => 'الإشعارات',
			'privacyPolicy' => 'سياسة الخصوصية',
			'moreOptions' => 'المزيد من الخيارات',
			'languages' => 'اللغات',
			'doctorHuntPrivacyPolicyTitle' => 'سياسة الخصوصية لتطبيقات Doctor Hunt',
			'privacyPolicyIntro' => 'هناك العديد من الأشكال المختلفة لنصوص لوريم إيبسوم المتاحة، ولكن غالبيتها خضعت للتعديل بشكل ما، عن طريق إدخال روح الدعابة أو كلمات عشوائية مقبولة. إنها حقيقة مثبتة منذ زمن طويل أن القارئ سيتشتت انتباهه بالمحتوى المقروء للصفحة عند النظر إلى تصميمها.',
			'privacyPolicyPoint1' => 'تمت إعادة إنتاج الجزء القياسي من لوريم إيبسوم المستخدم منذ القرن السادس عشر أدناه للمهتمين بذلك.',
			'privacyPolicyPoint2' => 'الأقسام 1.10.32 و 1.10.33 من كتاب "عن أقصى درجات الخير والشر". الغرض من الاستخدام.',
			'privacyPolicyPoint3' => 'حقيقة مثبتة منذ زمن طويل أن القارئ سيتشتت انتباهه بالمحتوى المقروء للصفحة.',
			'privacyPolicyPoint4' => 'الهدف من استخدام لوريم إيبسوم هو توفير نص يشبه النص الطبيعي دون تشتيت الانتباه.',
			'privacyPolicyOutro' => 'إنها حقيقة مثبتة منذ وقت طويل أن القارئ سيتشتت بالمحتوى المقروء للصفحة عند النظر إلى تصميمها العام.',
			'profile' => 'الملف الشخصي',
			'personalInformation' => 'المعلومات الشخصية',
			'continueButton' => 'متابعة',
			'favouriteDoctors' => 'الأطباء المفضلين',
			'upcoming' => 'القادم',
			'completed' => 'اكتمل',
			'cancelled' => 'ألغيت',
			'pleaseSelectAnAppointmentSlot' => 'يرجى اختيار موعد',
			'selectLanguage' => 'اختر اللغة',
			'choosePreferredLanguage' => 'اختر لغتك المفضلة',
			'arabic' => 'العربية',
			'english' => 'English',
			'arabicSubtitle' => 'العربية',
			'englishSubtitle' => 'الإنجليزية',
			'noFavoriteDoctors' => 'لا يوجد أطباء مفضلين',
			'noFavoriteDoctorsDescription' => 'لم تقم بإضافة أي أطباء مفضلين بعد.',
			'appointmentDate' => 'تاريخ الموعد',
			'appointmentTime' => 'وقت الموعد',
			'viewDetails' => 'عرض التفاصيل',
			'cancelAppointment' => 'إلغاء الموعد',
			'tapToRateYourVisit' => 'اضغط لتقييم زيارتك',
			'rateDoctor' => 'تقييم الطبيب',
			'noAppointmentsYet' => 'لا يوجد مواعيد',
			'youHaventBookedAnyAppointmentsYet' => 'لم تحجز أي مواعيد حتى الآن',
			'noAppointmentsFound' => 'لا يوجد مواعيد',
			'noAppointmentsDescription' => 'لا يوجد مواعيد مجدولة حالياً. تحقق لاحقاً من وجود تحديثات',
			'date' => 'التاريخ',
			'time' => 'الوقت',
			'fee' => 'الرسوم',
			'markAsCompleted' => 'تحديد كمكتمل',
			'appointmentDetails' => 'تفاصيل الموعد',
			'doctor' => 'الطبيب',
			'yesCancel' => 'نعم، إلغاء',
			'cancelAppointmentConfirmation' => 'هل أنت متأكد من رغبتك في إلغاء هذا الموعد؟',
			_ => null,
		};
	}
}
