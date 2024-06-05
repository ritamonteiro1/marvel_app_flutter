import 'dart:convert';

import 'package:crypto/crypto.dart';

extension StringsExtensions on String {
  String generateHash() {
    final bytes = utf8.encode(this);
    final digest = md5.convert(bytes);
    return digest.toString();
  }
}
