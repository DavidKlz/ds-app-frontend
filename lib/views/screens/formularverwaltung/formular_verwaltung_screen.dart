import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/blocs/formular_verwaltung/formular_verwaltung_bloc.dart';
import 'widgets/formular_verwaltung_list.dart';

class FormularVerwaltungScreen extends StatefulWidget {
  const FormularVerwaltungScreen({super.key});

  @override
  State<FormularVerwaltungScreen> createState() =>
      _FormularVerwaltungScreenState();
}

class _FormularVerwaltungScreenState extends State<FormularVerwaltungScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FormularVerwaltungBloc>(context)
        .add(FetchFormularVerwaltung());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormularVerwaltungBloc, FormularVerwaltungState>(
      builder: (context, state) {
        if (state is FormularVerwaltungFetched) {
          return const FormularVerwaltungList();
        } else {
          return const Placeholder();
        }
      },
    );
  }
}
