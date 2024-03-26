import 'package:ds_app/config/routes/routes.dart';
import 'package:ds_app/views/pages/dyn_mask/dyn_mask_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/formular.dart';
import '../../data/repositories/formular_repository.dart';
import '../../logic/blocs/formular/formular_bloc.dart';
import '../../views/pages/form/form_page.dart';
import '../../views/pages/home/home_page.dart';

class RouteGenerator {
  RouteGenerator._();

  static String currentRoute = Routes.login;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    currentRoute = settings.name!;

    switch (currentRoute) {
      case Routes.formular:
        Formular form = settings.arguments != null
            ? settings.arguments as Formular
            : Formular.empty();
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => FormularBloc(FormularRepository()),
                  child: FormPage(form: form),
                ));
      case Routes.dynMask:
        Formular form = settings.arguments as Formular;
        return MaterialPageRoute(
          builder: (context) => DynMaskPage(form),
        );
      case Routes.formularVerwaltung:
        return MaterialPageRoute(builder: (context) => const HomePage());
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
