import 'character_data.dart';

class CharacterList {
  final int offset;
  final int limit;
  final int total;
  final int count;
  final List<CharacterData> characterList;

  CharacterList({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.characterList,
  });
}
