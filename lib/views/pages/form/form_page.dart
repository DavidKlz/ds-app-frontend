import 'package:flutter/material.dart';

import '../../../data/models/formular.dart';

class FormPage extends StatefulWidget {
  final Formular? form;
  const FormPage({this.form, super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late Formular form;

  @override
  void initState() {
    super.initState();
    form = widget.form ?? Formular();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(form.name ?? "Formular erstellen"),
      ),
    );
  }
}
