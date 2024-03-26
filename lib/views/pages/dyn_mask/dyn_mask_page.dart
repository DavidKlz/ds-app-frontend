import 'package:flutter/material.dart';

import '../../../data/models/formular.dart';

class DynMaskPage extends StatelessWidget {
  final Formular form;
  const DynMaskPage(this.form, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(form.name),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.send),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: form.variables
              .map((e) => Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: e.controlType.create(
                      label: e.name, type: e.dataType, values: e.values)))
              .toList(),
        ),
      ),
    );
  }
}
