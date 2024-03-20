import 'package:ds_app/data/repositories/formular_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/formular.dart';

part 'formular_verwaltung_event.dart';
part 'formular_verwaltung_state.dart';

class FormularVerwaltungBloc
    extends Bloc<FormularVerwaltungEvent, FormularVerwaltungState> {
  final FormularRepository repo;
  FormularVerwaltungBloc(this.repo) : super(FormularVerwaltungInitial()) {
    on<FetchFormularVerwaltung>((event, emit) {
      emit(FormularVerwaltungFetching());

      repo.fetchFormulare().listen((forms) {
        add(FormularVerwaltungUpdate(forms));
      });
    });
    on<FormularVerwaltungUpdate>((event, emit) {
      emit(FormularVerwaltungFetching());
      emit(FormularVerwaltungFetched(event.forms));
    });
  }
}
