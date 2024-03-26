import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/blocs/formular_verwaltung/formular_verwaltung_bloc.dart';
import 'formular_item.dart';

class FormularVerwaltungList extends StatefulWidget {
  const FormularVerwaltungList({super.key});

  @override
  State<FormularVerwaltungList> createState() => _FormularVerwaltungListState();
}

class _FormularVerwaltungListState extends State<FormularVerwaltungList>
    with RouteAware {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: (context.read<FormularVerwaltungBloc>().state
              as FormularVerwaltungFetched)
          .forms
          .map(
            (e) => FormularItem(e),
          )
          .toList(),
    );
  }

  @override
  void didPush() {
    context.read<FormularVerwaltungBloc>().add(FetchFormularVerwaltung());
    super.didPush();
  }
}
