import 'package:ds_app/views/screens/formularverwaltung/formular_verwaltung_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/formular_repository.dart';
import '../../../logic/blocs/formular_verwaltung/formular_verwaltung_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("DS App", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
      body: BlocProvider(
        create: (context) => FormularVerwaltungBloc(FormularRepository()),
        child: const FormularVerwaltungScreen(),
      ),
    );
  }
}
