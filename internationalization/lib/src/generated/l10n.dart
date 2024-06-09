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

  /// `Personagens`
  String get app_bar_title_home_screen {
    return Intl.message(
      'Personagens',
      name: 'app_bar_title_home_screen',
      desc: '',
      args: [],
    );
  }

  /// `Detalhes`
  String get app_bar_title_character_details_screen {
    return Intl.message(
      'Detalhes',
      name: 'app_bar_title_character_details_screen',
      desc: '',
      args: [],
    );
  }

  /// `Favoritos`
  String get app_bar_title_favorite_characters_screen {
    return Intl.message(
      'Favoritos',
      name: 'app_bar_title_favorite_characters_screen',
      desc: '',
      args: [],
    );
  }

  /// `Ops!\nOcorreu um erro`
  String get message_generic_error {
    return Intl.message(
      'Ops!\nOcorreu um erro',
      name: 'message_generic_error',
      desc: '',
      args: [],
    );
  }

  /// `Ops!\nFalha na conexão`
  String get message_network_error {
    return Intl.message(
      'Ops!\nFalha na conexão',
      name: 'message_network_error',
      desc: '',
      args: [],
    );
  }

  /// `Fim da lista`
  String get message_no_more_characters {
    return Intl.message(
      'Fim da lista',
      name: 'message_no_more_characters',
      desc: '',
      args: [],
    );
  }

  /// `Tentar novamente`
  String get message_try_again {
    return Intl.message(
      'Tentar novamente',
      name: 'message_try_again',
      desc: '',
      args: [],
    );
  }

  /// `Tentando novamente...`
  String get message_trying_again {
    return Intl.message(
      'Tentando novamente...',
      name: 'message_trying_again',
      desc: '',
      args: [],
    );
  }

  /// `Sem personagens favoritos`
  String get message_no_favorite_characters {
    return Intl.message(
      'Sem personagens favoritos',
      name: 'message_no_favorite_characters',
      desc: '',
      args: [],
    );
  }

  /// `Comics:`
  String get comics_text {
    return Intl.message(
      'Comics:',
      name: 'comics_text',
      desc: '',
      args: [],
    );
  }

  /// `Favoritar`
  String get favorite_text {
    return Intl.message(
      'Favoritar',
      name: 'favorite_text',
      desc: '',
      args: [],
    );
  }

  /// `Desfavoritar`
  String get unfavorite_text {
    return Intl.message(
      'Desfavoritar',
      name: 'unfavorite_text',
      desc: '',
      args: [],
    );
  }

  /// `Ícone de erro`
  String get semantic_label_icon_error {
    return Intl.message(
      'Ícone de erro',
      name: 'semantic_label_icon_error',
      desc: '',
      args: [],
    );
  }

  /// `Ícone de erro de internet`
  String get semantic_label_icon_network_error {
    return Intl.message(
      'Ícone de erro de internet',
      name: 'semantic_label_icon_network_error',
      desc: '',
      args: [],
    );
  }

  /// `Carregando...`
  String get semantic_label_loading_text {
    return Intl.message(
      'Carregando...',
      name: 'semantic_label_loading_text',
      desc: '',
      args: [],
    );
  }

  /// `Card do personagem {name} clicado. Ir para tela de detalhes`
  String semantic_label_card_primary_action(Object name) {
    return Intl.message(
      'Card do personagem $name clicado. Ir para tela de detalhes',
      name: 'semantic_label_card_primary_action',
      desc: '',
      args: [name],
    );
  }

  /// `Ícone de coração. Ir para tela de favoritos`
  String get semantic_label_icon_button_favorite {
    return Intl.message(
      'Ícone de coração. Ir para tela de favoritos',
      name: 'semantic_label_icon_button_favorite',
      desc: '',
      args: [],
    );
  }

  /// `Voltar para o início da lista de personagens`
  String get semantic_label_floating_action_button {
    return Intl.message(
      'Voltar para o início da lista de personagens',
      name: 'semantic_label_floating_action_button',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<MarvelStrings> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
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
