part of 'formular_verwaltung_bloc.dart';

sealed class FormularVerwaltungEvent extends Equatable {
  const FormularVerwaltungEvent();

  @override
  List<Object> get props => [];
}

final class FetchFormularVerwaltung extends FormularVerwaltungEvent {}

final class FormularVerwaltungUpdate extends FormularVerwaltungEvent {
  final List<Formular> forms;

  const FormularVerwaltungUpdate(this.forms);

  @override
  List<Object> get props => [forms];
}
