import 'package:hive/hive.dart';

part 'character_cache.g.dart';

@HiveType(typeId: 1)
class CharacterCache {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String modified;
  @HiveField(4)
  final String imageUrl;
  @HiveField(5)
  final List<String> comics;

  CharacterCache({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.imageUrl,
    required this.comics,
  });
}
