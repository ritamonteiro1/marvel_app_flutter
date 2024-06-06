abstract class MarvelEnvironment {
  static const publicApiKey = String.fromEnvironment(
    'MARVEL_PUBLIC_API_KEY',
  );
  static const privateApiKey = String.fromEnvironment(
    'MARVEL_PRIVATE_API_KEY',
  );
}
