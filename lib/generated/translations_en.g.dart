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
	late final Translations$auth$en auth = Translations$auth$en.internal(_root);
	late final Translations$home$en home = Translations$home$en.internal(_root);
}

// Path: common
class Translations$common$en {
	Translations$common$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

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

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Forgot Password?'
	String get forgotPassword => 'Forgot Password?';
}

// Path: home
class Translations$home$en {
	Translations$home$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Welcome'
	String get welcome => 'Welcome';

	/// en: 'Popular Doctors'
	String get popularDoctors => 'Popular Doctors';

	/// en: 'See All'
	String get seeAll => 'See All';

	/// en: 'Search doctors...'
	String get searchDoctors => 'Search doctors...';
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
			'common.kContinue' => 'Continue',
			'common.cancel' => 'Cancel',
			'common.save' => 'Save',
			'common.delete' => 'Delete',
			'common.retry' => 'Retry',
			'common.search' => 'Search',
			'auth.login' => 'Login',
			'auth.register' => 'Register',
			'auth.email' => 'Email',
			'auth.password' => 'Password',
			'auth.forgotPassword' => 'Forgot Password?',
			'home.welcome' => 'Welcome',
			'home.popularDoctors' => 'Popular Doctors',
			'home.seeAll' => 'See All',
			'home.searchDoctors' => 'Search doctors...',
			_ => null,
		};
	}
}
