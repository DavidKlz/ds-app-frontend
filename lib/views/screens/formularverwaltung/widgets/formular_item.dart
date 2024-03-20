import 'package:flutter/material.dart';

import '../../../../data/models/formular.dart';

class FormularItem extends StatelessWidget {
  final Formular form;
  const FormularItem(this.form, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(form.name!),
    );
  }
}
