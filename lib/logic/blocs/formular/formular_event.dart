part of 'formular_bloc.dart';

sealed class FormularEvent extends Equatable {
  const FormularEvent();

  @override
  List<Object> get props => [];
}

class SaveFormular extends FormularEvent {
  final Formular form;

  const SaveFormular(this.form);

  @override
  List<Object> get props => [form];
}
