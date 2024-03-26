part of 'formular_bloc.dart';

sealed class FormularState extends Equatable {
  const FormularState();

  @override
  List<Object> get props => [];
}

final class FormularInitial extends FormularState {}

final class SavingFormular extends FormularState {}

final class FormularSaved extends FormularState {
  final Formular form;

  const FormularSaved(this.form);

  @override
  List<Object> get props => [form];
}
