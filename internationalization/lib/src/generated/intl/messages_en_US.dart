// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
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
  String get localeName => 'en_US';

  static String m0(name) =>
      "Character card ${name} clicked. Navigate to detail screen";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "app_bar_title_character_details_screen":
            MessageLookupByLibrary.simpleMessage("Details"),
        "app_bar_title_favorite_characters_screen":
            MessageLookupByLibrary.simpleMessage("Favorites"),
        "app_bar_title_home_screen":
            MessageLookupByLibrary.simpleMessage("Characters"),
        "app_name": MessageLookupByLibrary.simpleMessage("Marvel App"),
        "comics_text": MessageLookupByLibrary.simpleMessage("Comics:"),
        "favorite_text": MessageLookupByLibrary.simpleMessage("Favorite"),
        "message_generic_error":
            MessageLookupByLibrary.simpleMessage("Ops!\nAn error occurred"),
        "message_network_error":
            MessageLookupByLibrary.simpleMessage("Ops!\nConnection fail"),
        "message_no_favorite_characters":
            MessageLookupByLibrary.simpleMessage("No favorite characters"),
        "message_no_more_characters":
            MessageLookupByLibrary.simpleMessage("List ends here"),
        "message_try_again": MessageLookupByLibrary.simpleMessage("Try again"),
        "message_trying_again":
            MessageLookupByLibrary.simpleMessage("Trying again..."),
        "semantic_label_card_primary_action": m0,
        "semantic_label_floating_action_button":
            MessageLookupByLibrary.simpleMessage(
                "Back to the top of the character list"),
        "semantic_label_icon_button_favorite":
            MessageLookupByLibrary.simpleMessage(
                "Heart icon. Navigate to favorites screen"),
        "semantic_label_icon_error":
            MessageLookupByLibrary.simpleMessage("Error icon"),
        "semantic_label_icon_network_error":
            MessageLookupByLibrary.simpleMessage("Internet error icon"),
        "semantic_label_loading_text":
            MessageLookupByLibrary.simpleMessage("Loading..."),
        "unfavorite_text": MessageLookupByLibrary.simpleMessage("Unfavorite")
      };
}
