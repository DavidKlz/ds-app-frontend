class EitcoUrls {
  EitcoUrls._();

  static const String _baseUrl = "http://localhost:8010";

  static const String formular = "$_baseUrl/formular";
  static const String createFormular = "$formular/create";
  static String formularById(String id) => "$formular/$id";
}
