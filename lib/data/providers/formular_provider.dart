import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../config/constants/eitco_constants.dart';
import '../../config/constants/eitco_urls.dart';
import '../../config/constants/status_codes.dart';
import '../models/formular.dart';

class FormularProvider {
  Future<List<Formular>> fetchFormulare() async {
    try {
      final repsonse = await http.get(Uri.parse(EitcoUrls.formular));
      List<dynamic> json = jsonDecode(repsonse.body);

      List<Formular> formulare = List.empty(growable: true);
      for (dynamic item in json) {
        formulare.add(Formular.fromMap(item));
      }
      return formulare;
    } catch (err) {
      return List.empty();
    }
  }

  Future<Formular?> fetchFormular(String id) async {
    try {
      final repsonse = await http.get(Uri.parse(EitcoUrls.formularById(id)));

      return Formular.fromJson(repsonse.body);
    } catch (err) {
      return null;
    }
  }

  Future<Formular?> createFormular(Formular formular) async {
    try {
      final repsonse = await http.post(Uri.parse(EitcoUrls.createFormular),
          headers: EitcoConstants.defaultJsonRequestHeader,
          body: formular.toJson());

      return Formular.fromJson(repsonse.body);
    } catch (err) {
      return null;
    }
  }

  Future<bool> deleteFormular(String id) async {
    try {
      final response = await http.delete(Uri.parse(EitcoUrls.formularById(id)));
      return StatusCodes.requestOK.contains(response.statusCode);
    } catch (err) {
      return false;
    }
  }

  Future<Formular?> updateFormular(Formular formular) async {
    try {
      final response = await http.put(
          Uri.parse(EitcoUrls.formularById(formular.id!)),
          headers: EitcoConstants.defaultJsonRequestHeader,
          body: formular.toJson());
      return Formular.fromJson(response.body);
    } catch (err) {
      return null;
    }
  }
}
