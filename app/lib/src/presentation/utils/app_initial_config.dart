import 'package:hive_flutter/adapters.dart';
import '../../data/di/data_di.dart';
import '../../data/local/model/character_cache.dart';
import '../../domain/di/domain_di.dart';
import '../di/presentation_di.dart';

abstract class AppInitialConfig {
  static Future<void> execute() async {
    await _initializeDependencies();
    await _initializeHive();
  }

  static Future<void> _initializeDependencies() async {
    dataDI();
    domainDI();
    presentationDI();
  }

  static Future<void> _initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter<CharacterCache>(CharacterCacheAdapter());
  }
}
