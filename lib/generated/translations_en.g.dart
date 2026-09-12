///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	dynamic operator[](String key) => _meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'Doctor Hunt'
	String get appName => 'Doctor Hunt';

	late final Translations$common$en common = Translations$common$en.internal(_root);
	late final Translations$onboarding$en onboarding = Translations$onboarding$en.internal(_root);
	late final Translations$chooseRole$en chooseRole = Translations$chooseRole$en.internal(_root);
	late final Translations$auth$en auth = Translations$auth$en.internal(_root);
	late final Translations$validations$en validations = Translations$validations$en.internal(_root);
}

// Path: common
class Translations$common$en {
	Translations$common$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Patient'
	String get patient => 'Patient';

	/// en: 'Admin'
	String get admin => 'Admin';

	/// en: 'Continue'
	String get kContinue => 'Continue';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Skip'
	String get skip => 'Skip';
}

// Path: onboarding
class Translations$onboarding$en {
	Translations$onboarding$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Get Started'
	String get getStarted => 'Get Started';

	/// en: 'Find Trusted Doctors'
	String get findTrustedDoctors => 'Find Trusted Doctors';

	/// en: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.'
	String get findTrustedDoctorsDescription => 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.';

	/// en: 'Choose Best Doctors'
	String get chooseBestDoctors => 'Choose Best Doctors';

	/// en: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.'
	String get chooseBestDoctorsDescription => 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.';

	/// en: 'Easy Appointments'
	String get easyAppointments => 'Easy Appointments';

	/// en: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old..'
	String get easyAppointmentsDescription => 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old..';
}

// Path: chooseRole
class Translations$chooseRole$en {
	Translations$chooseRole$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Choose Your Role'
	String get chooseYourRole => 'Choose Your Role';

	/// en: 'The selected role determines the experience and available features.'
	String get chooseYourRoleDescription => 'The selected role determines the experience and available features.';

	/// en: 'Find doctors, book appointments, and manage your medical records.'
	String get patientDescription => 'Find doctors, book appointments, and manage your medical records.';

	/// en: 'Manage doctors, appointments, users, and the platform.'
	String get adminDescription => 'Manage doctors, appointments, users, and the platform.';
}

// Path: auth
class Translations$auth$en {
	Translations$auth$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Login'
	String get login => 'Login';

	/// en: 'Register'
	String get register => 'Register';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Forgot Password'
	String get forgotPassword => 'Forgot Password';

	/// en: 'Google'
	String get google => 'Google';

	/// en: 'Facebook'
	String get facebook => 'Facebook';

	/// en: 'Welcome back'
	String get welcomeBack => 'Welcome back';

	/// en: 'Join us to start searching'
	String get joinUsToStartSearching => 'Join us to start searching';

	/// en: 'You can search course, apply course and find scholarship for abroad studies'
	String get youCanSearchCourseApplyCourseAndFindScholarshipForAbroadStudies => 'You can search course, apply course and find scholarship for abroad studies';

	/// en: 'Don’t have an account?'
	String get dontHaveAnAccount => 'Don’t have an account?';

	/// en: 'Join us'
	String get joinUs => 'Join us';

	/// en: 'Have an account?'
	String get haveAnAccount => 'Have an account?';

	/// en: 'Log in'
	String get logIn => 'Log in';

	/// en: 'I agree with the Terms of Service & Privacy Policy'
	String get agreeToTerms => 'I agree with the Terms of Service & Privacy Policy';

	/// en: 'Sign Up'
	String get signUp => 'Sign Up';
}

// Path: validations
class Translations$validations$en {
	Translations$validations$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '$fieldName is required'
	String required({required Object fieldName}) => '${fieldName} is required';

	/// en: 'Email is required'
	String get emailRequired => 'Email is required';

	/// en: 'Please enter a valid email'
	String get invalidEmail => 'Please enter a valid email';

	/// en: 'Password is required'
	String get passwordRequired => 'Password is required';

	/// en: 'Password must be at least 8 characters'
	String get passwordMinLength => 'Password must be at least 8 characters';

	/// en: 'Password must contain at least one uppercase letter'
	String get passwordRequiresUppercase => 'Password must contain at least one uppercase letter';

	/// en: 'Password must contain at least one lowercase letter'
	String get passwordRequiresLowercase => 'Password must contain at least one lowercase letter';

	/// en: 'Password must contain at least one number'
	String get passwordRequiresNumber => 'Password must contain at least one number';

	/// en: 'Password must contain at least one special character'
	String get passwordRequiresSpecialCharacter => 'Password must contain at least one special character';

	/// en: 'Name is required'
	String get nameRequired => 'Name is required';

	/// en: 'Name must be at least 3 characters'
	String get nameMinLength => 'Name must be at least 3 characters';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appName' => 'Doctor Hunt',
			'common.patient' => 'Patient',
			'common.admin' => 'Admin',
			'common.kContinue' => 'Continue',
			'common.cancel' => 'Cancel',
			'common.save' => 'Save',
			'common.delete' => 'Delete',
			'common.retry' => 'Retry',
			'common.search' => 'Search',
			'common.next' => 'Next',
			'common.skip' => 'Skip',
			'onboarding.getStarted' => 'Get Started',
			'onboarding.findTrustedDoctors' => 'Find Trusted Doctors',
			'onboarding.findTrustedDoctorsDescription' => 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
			'onboarding.chooseBestDoctors' => 'Choose Best Doctors',
			'onboarding.chooseBestDoctorsDescription' => 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
			'onboarding.easyAppointments' => 'Easy Appointments',
			'onboarding.easyAppointmentsDescription' => 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old..',
			'chooseRole.chooseYourRole' => 'Choose Your Role',
			'chooseRole.chooseYourRoleDescription' => 'The selected role determines the experience and available features.',
			'chooseRole.patientDescription' => 'Find doctors, book appointments, and manage your medical records.',
			'chooseRole.adminDescription' => 'Manage doctors, appointments, users, and the platform.',
			'auth.login' => 'Login',
			'auth.register' => 'Register',
			'auth.name' => 'Name',
			'auth.email' => 'Email',
			'auth.password' => 'Password',
			'auth.forgotPassword' => 'Forgot Password',
			'auth.google' => 'Google',
			'auth.facebook' => 'Facebook',
			'auth.welcomeBack' => 'Welcome back',
			'auth.joinUsToStartSearching' => 'Join us to start searching',
			'auth.youCanSearchCourseApplyCourseAndFindScholarshipForAbroadStudies' => 'You can search course, apply course and find scholarship for abroad studies',
			'auth.dontHaveAnAccount' => 'Don’t have an account?',
			'auth.joinUs' => 'Join us',
			'auth.haveAnAccount' => 'Have an account?',
			'auth.logIn' => 'Log in',
			'auth.agreeToTerms' => 'I agree with the Terms of Service & Privacy Policy',
			'auth.signUp' => 'Sign Up',
			'validations.required' => ({required Object fieldName}) => '${fieldName} is required',
			'validations.emailRequired' => 'Email is required',
			'validations.invalidEmail' => 'Please enter a valid email',
			'validations.passwordRequired' => 'Password is required',
			'validations.passwordMinLength' => 'Password must be at least 8 characters',
			'validations.passwordRequiresUppercase' => 'Password must contain at least one uppercase letter',
			'validations.passwordRequiresLowercase' => 'Password must contain at least one lowercase letter',
			'validations.passwordRequiresNumber' => 'Password must contain at least one number',
			'validations.passwordRequiresSpecialCharacter' => 'Password must contain at least one special character',
			'validations.nameRequired' => 'Name is required',
			'validations.nameMinLength' => 'Name must be at least 3 characters',
			_ => null,
		};
	}
}
