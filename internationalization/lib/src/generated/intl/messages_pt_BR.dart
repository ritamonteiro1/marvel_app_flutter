// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt_BR locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pt_BR';

  static String m0(name) =>
      "Card do personagem ${name} clicado. Ir para tela de detalhes";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "app_bar_title_character_details_screen":
            MessageLookupByLibrary.simpleMessage("Detalhes"),
        "app_bar_title_favorite_characters_screen":
            MessageLookupByLibrary.simpleMessage("Favoritos"),
        "app_bar_title_home_screen":
            MessageLookupByLibrary.simpleMessage("Personagens"),
        "app_name": MessageLookupByLibrary.simpleMessage("Marvel App"),
        "comics_text": MessageLookupByLibrary.simpleMessage("Comics:"),
        "favorite_text": MessageLookupByLibrary.simpleMessage("Favoritar"),
        "message_generic_error":
            MessageLookupByLibrary.simpleMessage("Ops!\nOcorreu um erro"),
        "message_network_error":
            MessageLookupByLibrary.simpleMessage("Ops!\nFalha na conexão"),
        "message_no_favorite_characters":
            MessageLookupByLibrary.simpleMessage("Sem personagens favoritos"),
        "message_no_more_characters":
            MessageLookupByLibrary.simpleMessage("Fim da lista"),
        "message_try_again":
            MessageLookupByLibrary.simpleMessage("Tentar novamente"),
        "message_trying_again":
            MessageLookupByLibrary.simpleMessage("Tentando novamente..."),
        "semantic_label_card_primary_action": m0,
        "semantic_label_floating_action_button":
            MessageLookupByLibrary.simpleMessage(
                "Voltar para o início da lista de personagens"),
        "semantic_label_icon_button_favorite":
            MessageLookupByLibrary.simpleMessage(
                "Ícone de coração. Ir para tela de favoritos"),
        "semantic_label_icon_error":
            MessageLookupByLibrary.simpleMessage("Ícone de erro"),
        "semantic_label_icon_network_error":
            MessageLookupByLibrary.simpleMessage("Ícone de erro de internet"),
        "semantic_label_loading_text":
            MessageLookupByLibrary.simpleMessage("Carregando..."),
        "unfavorite_text": MessageLookupByLibrary.simpleMessage("Desfavoritar")
      };
}
