class EitcoUrls {
  EitcoUrls._();

  static const String _baseUrl = "http://127.0.0.1:53070";

  static const String formular = "$_baseUrl/formular";
  static const String formulare = "$formular/all";
  static const String createFormular = "$formular/create";
  static String formularById(String id) => "$formular/$id";
}
