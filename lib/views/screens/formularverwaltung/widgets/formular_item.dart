import 'package:flutter/material.dart';

import '../../../../config/routes/routes.dart';
import '../../../../data/models/formular.dart';

class FormularItem extends StatelessWidget {
  final Formular form;
  const FormularItem(this.form, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        onTap: () =>
            Navigator.of(context).pushNamed(Routes.formular, arguments: form),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(form.name, style: const TextStyle(fontSize: 18)),
              IconButton(
                onPressed: () => Navigator.of(context)
                    .pushNamed(Routes.dynMask, arguments: form),
                icon: const Icon(Icons.open_in_new),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
