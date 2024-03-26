import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/formular.dart';
import '../../../data/repositories/formular_repository.dart';

part 'formular_event.dart';
part 'formular_state.dart';

class FormularBloc extends Bloc<FormularEvent, FormularState> {
  final FormularRepository repo;
  FormularBloc(this.repo) : super(FormularInitial()) {
    on<SaveFormular>((event, emit) async {
      emit(SavingFormular());
      Formular savedForm;

      if (event.form.id.isEmpty) {
        savedForm = await repo.createFormular(event.form);
      } else {
        savedForm = await repo.updateFormular(event.form);
      }

      emit(FormularSaved(savedForm));
    });
  }
}
