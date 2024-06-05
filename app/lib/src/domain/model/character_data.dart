class CharacterData {
  final int id;
  final String name;
  final String description;
  final String modified;
  final String imageUrl;
  final List<String> comics;

  CharacterData({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.imageUrl,
    required this.comics,
  });
}
