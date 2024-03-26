import 'package:ds_app/views/pages/form/widgets/variable_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/formular.dart';
import '../../../data/models/variable.dart';
import '../../../logic/blocs/formular/formular_bloc.dart';

class FormPage extends StatefulWidget {
  final Formular? form;
  const FormPage({this.form, super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController controller = TextEditingController();
  late Formular form;

  @override
  void initState() {
    super.initState();
    form = widget.form ?? Formular.empty();
    setState(() => controller.text = form.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(form.name.isEmpty ? "Formular erstellen" : form.name),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<FormularBloc>().add(SaveFormular(form)),
        child: const Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Formular Name",
                    ),
                    controller: controller,
                    onChanged: (value) => form.name = value,
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: form.variables
                        .map((e) => Column(
                              children: [
                                const Divider(),
                                VariableItem(
                                    e,
                                    () => setState(() {
                                          form.variables.remove(e);
                                        })),
                              ],
                            ))
                        .toList(),
                  ),
                  IconButton(
                    onPressed: () =>
                        setState(() => form.variables.add(Variable.empty())),
                    icon: const Icon(Icons.add),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
