import 'package:ds_app/data/providers/formular_provider.dart';

import '../models/formular.dart';

class FormularRepository {
  final _provider = FormularProvider();
  List<Formular> formularCache = List.empty(growable: true);

  Stream<List<Formular>> fetchFormulare() async* {
    if (formularCache.isNotEmpty) {
      yield formularCache;
    }

    formularCache = await _provider.fetchFormulare();

    yield formularCache;
  }

  Stream<Formular?> fetchFormular(String id) async* {
    Future<Formular?> futureForm = _provider.fetchFormular(id);

    if (formularCache.isNotEmpty &&
        formularCache.where((element) => element.id == id).isNotEmpty) {
      Formular cachedForm =
          formularCache.firstWhere((element) => element.id == id);
      yield cachedForm;

      Formular? newForm = await futureForm;

      if (newForm == null) {
        formularCache.remove(cachedForm);
        yield newForm;
      } else if (cachedForm != newForm) {
        formularCache.remove(cachedForm);
        formularCache.add(newForm);
        yield newForm;
      }
    } else {
      yield await futureForm;
    }
  }

  Future<Formular> createFormular(Formular formular) async {
    Formular newForm = await _provider.createFormular(formular);
    formularCache.add(newForm);

    return newForm;
  }

  Future<bool> deleteFormular(String id) async {
    bool deleted = await _provider.deleteFormular(id);

    if (deleted) {
      formularCache.removeWhere((element) => element.id == id);
    }

    return deleted;
  }

  Future<Formular> updateFormular(Formular formular) async {
    Formular updatedForm = await _provider.updateFormular(formular);

    formularCache.removeWhere((element) => element.id == formular.id);
    formularCache.add(updatedForm);

    return updatedForm;
  }
}
