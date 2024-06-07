// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class MarvelStrings {
  MarvelStrings();

  static MarvelStrings? _current;

  static MarvelStrings get current {
    assert(_current != null,
        'No instance of MarvelStrings was loaded. Try to initialize the MarvelStrings delegate before accessing MarvelStrings.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<MarvelStrings> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = MarvelStrings();
      MarvelStrings._current = instance;

      return instance;
    });
  }

  static MarvelStrings of(BuildContext context) {
    final instance = MarvelStrings.maybeOf(context);
    assert(instance != null,
        'No instance of MarvelStrings present in the widget tree. Did you add MarvelStrings.delegate in localizationsDelegates?');
    return instance!;
  }

  static MarvelStrings? maybeOf(BuildContext context) {
    return Localizations.of<MarvelStrings>(context, MarvelStrings);
  }

  /// `Marvel App`
  String get app_name {
    return Intl.message(
      'Marvel App',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Characters`
  String get app_bar_title_home_screen {
    return Intl.message(
      'Characters',
      name: 'app_bar_title_home_screen',
      desc: '',
      args: [],
    );
  }

  /// `Character Details`
  String get app_bar_title_character_details_screen {
    return Intl.message(
      'Character Details',
      name: 'app_bar_title_character_details_screen',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Characters`
  String get app_bar_title_favorite_characters_screen {
    return Intl.message(
      'Favorite Characters',
      name: 'app_bar_title_favorite_characters_screen',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<MarvelStrings> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<MarvelStrings> load(Locale locale) => MarvelStrings.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
