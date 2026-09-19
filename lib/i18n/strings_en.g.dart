///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

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

	late final Translations$common$en common = Translations$common$en._(_root);
	late final Translations$onboarding$en onboarding = Translations$onboarding$en._(_root);
	late final Translations$chooseRole$en chooseRole = Translations$chooseRole$en._(_root);
	late final Translations$auth$en auth = Translations$auth$en._(_root);
	late final Translations$validations$en validations = Translations$validations$en._(_root);
	late final Translations$home$en home = Translations$home$en._(_root);
	late final Translations$doctorDetails$en doctorDetails = Translations$doctorDetails$en._(_root);
	late final Translations$findDoctors$en findDoctors = Translations$findDoctors$en._(_root);
	late final Translations$appointment$en appointment = Translations$appointment$en._(_root);
}

// Path: common
class Translations$common$en {
	Translations$common$en._(this._root);

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

	/// en: 'Live'
	String get live => 'Live';

	/// en: 'hour'
	String get hour => 'hour';

	/// en: 'Book Now'
	String get bookNow => 'Book Now';

	/// en: 'Confirm'
	String get confirm => 'Confirm';

	/// en: 'OR'
	String get or => 'OR';

	/// en: 'Done'
	String get done => 'Done';
}

// Path: onboarding
class Translations$onboarding$en {
	Translations$onboarding$en._(this._root);

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
	Translations$chooseRole$en._(this._root);

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
	Translations$auth$en._(this._root);

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

	/// en: 'Enter your email for the verification proccesss, we will send 4 digits code to your email.'
	String get forgotPasswordDescription => 'Enter your email for the verification proccesss, we will send 4 digits code to your email.';

	/// en: 'Enter 4 Digits Code'
	String get enterDigitsCode => 'Enter 4 Digits Code';

	/// en: 'Enter the 4 digits code that you received on your email.'
	String get enterDigitsDescription => 'Enter the 4 digits code that you received on your email.';

	/// en: 'Reset Password'
	String get resetPassword => 'Reset Password';

	/// en: 'New Password'
	String get newPassword => 'New Password';

	/// en: 'Re-enter Password'
	String get reEnterPassword => 'Re-enter Password';

	/// en: 'Update Password'
	String get updatePassword => 'Update Password';

	/// en: 'Set the new password for your account so you can login and access all the features.'
	String get resetPasswordDescription => 'Set the new password for your account so you can login and access all the features.';

	/// en: 'Code'
	String get code => 'Code';
}

// Path: validations
class Translations$validations$en {
	Translations$validations$en._(this._root);

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

	/// en: 'Confirm Password is required'
	String get confirmPasswordRequired => 'Confirm Password is required';

	/// en: 'Passwords do not match'
	String get passwordsDoNotMatch => 'Passwords do not match';
}

// Path: home
class Translations$home$en {
	Translations$home$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Hi $name!'
	String hi({required Object name}) => 'Hi ${name}!';

	/// en: 'Find Your Doctor'
	String get findYourDoctor => 'Find Your Doctor';

	/// en: 'Search.....'
	String get search => 'Search.....';

	/// en: 'Live Doctors'
	String get liveDoctors => 'Live Doctors';

	/// en: 'Popular Doctor'
	String get popularDoctor => 'Popular Doctor';

	/// en: 'Feature Doctor'
	String get featureDoctor => 'Feature Doctor';

	/// en: 'See All'
	String get seeAll => 'See All';
}

// Path: doctorDetails
class Translations$doctorDetails$en {
	Translations$doctorDetails$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Doctor Details'
	String get doctorDetails => 'Doctor Details';

	/// en: 'Runing'
	String get runing => 'Runing';

	/// en: 'Ongoing'
	String get ongoing => 'Ongoing';

	/// en: 'Patient'
	String get patient => 'Patient';

	/// en: 'Services'
	String get services => 'Services';
}

// Path: findDoctors
class Translations$findDoctors$en {
	Translations$findDoctors$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Find Doctors'
	String get findDoctors => 'Find Doctors';

	/// en: 'Next Available'
	String get nextAvailable => 'Next Available';

	/// en: 'Tomorrow'
	String get tomorrow => 'Tomorrow';

	/// en: 'Years experience'
	String get yearsExperience => 'Years experience';

	/// en: 'Patient Stories'
	String get patientStories => 'Patient Stories';
}

// Path: appointment
class Translations$appointment$en {
	Translations$appointment$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Appointment'
	String get appointment => 'Appointment';

	/// en: 'Available Time'
	String get availableTime => 'Available Time';

	/// en: 'Reminder Me Before'
	String get reminderMeBefore => 'Reminder Me Before';

	/// en: 'Minit'
	String get minit => 'Minit';

	/// en: 'No Slots Available'
	String get noSlotsAvailable => 'No Slots Available';

	/// en: 'Next Availability On'
	String get nextAvailabilityOn => 'Next Availability On';

	/// en: 'Contact Clinic'
	String get contactClinic => 'Contact Clinic';

	/// en: 'Your Appointment Successful'
	String get appointmentSuccessful => 'Your Appointment Successful';

	/// en: 'Thank You !'
	String get thankYou => 'Thank You !';

	/// en: 'You booked an appointment with Dr. $doctorName on $date, at $time'
	String appointmentSuccessfulDescription({required Object doctorName, required Object date, required Object time}) => 'You booked an appointment with Dr. ${doctorName} on ${date}, at ${time}';

	/// en: 'Edit your appointment'
	String get editYourAppointment => 'Edit your appointment';
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
			'common.live' => 'Live',
			'common.hour' => 'hour',
			'common.bookNow' => 'Book Now',
			'common.confirm' => 'Confirm',
			'common.or' => 'OR',
			'common.done' => 'Done',
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
			'auth.forgotPasswordDescription' => 'Enter your email for the verification proccesss, we will send 4 digits code to your email.',
			'auth.enterDigitsCode' => 'Enter 4 Digits Code',
			'auth.enterDigitsDescription' => 'Enter the 4 digits code that you received on your email.',
			'auth.resetPassword' => 'Reset Password',
			'auth.newPassword' => 'New Password',
			'auth.reEnterPassword' => 'Re-enter Password',
			'auth.updatePassword' => 'Update Password',
			'auth.resetPasswordDescription' => 'Set the new password for your account so you can login and access all the features.',
			'auth.code' => 'Code',
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
			'validations.confirmPasswordRequired' => 'Confirm Password is required',
			'validations.passwordsDoNotMatch' => 'Passwords do not match',
			'home.hi' => ({required Object name}) => 'Hi ${name}!',
			'home.findYourDoctor' => 'Find Your Doctor',
			'home.search' => 'Search.....',
			'home.liveDoctors' => 'Live Doctors',
			'home.popularDoctor' => 'Popular Doctor',
			'home.featureDoctor' => 'Feature Doctor',
			'home.seeAll' => 'See All',
			'doctorDetails.doctorDetails' => 'Doctor Details',
			'doctorDetails.runing' => 'Runing',
			'doctorDetails.ongoing' => 'Ongoing',
			'doctorDetails.patient' => 'Patient',
			'doctorDetails.services' => 'Services',
			'findDoctors.findDoctors' => 'Find Doctors',
			'findDoctors.nextAvailable' => 'Next Available',
			'findDoctors.tomorrow' => 'Tomorrow',
			'findDoctors.yearsExperience' => 'Years experience',
			'findDoctors.patientStories' => 'Patient Stories',
			'appointment.appointment' => 'Appointment',
			'appointment.availableTime' => 'Available Time',
			'appointment.reminderMeBefore' => 'Reminder Me Before',
			'appointment.minit' => 'Minit',
			'appointment.noSlotsAvailable' => 'No Slots Available',
			'appointment.nextAvailabilityOn' => 'Next Availability On',
			'appointment.contactClinic' => 'Contact Clinic',
			'appointment.appointmentSuccessful' => 'Your Appointment Successful',
			'appointment.thankYou' => 'Thank You !',
			'appointment.appointmentSuccessfulDescription' => ({required Object doctorName, required Object date, required Object time}) => 'You booked an appointment with Dr. ${doctorName} on ${date}, at ${time}',
			'appointment.editYourAppointment' => 'Edit your appointment',
			_ => null,
		};
	}
}
