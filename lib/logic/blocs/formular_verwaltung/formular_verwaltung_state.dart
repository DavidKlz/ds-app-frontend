part of 'formular_verwaltung_bloc.dart';

sealed class FormularVerwaltungState extends Equatable {
  const FormularVerwaltungState();

  @override
  List<Object> get props => [];
}

final class FormularVerwaltungInitial extends FormularVerwaltungState {}

final class FormularVerwaltungFetched extends FormularVerwaltungState {
  final List<Formular> forms;

  const FormularVerwaltungFetched(this.forms);

  @override
  List<Object> get props => [forms];
}

final class FormularVerwaltungFetching extends FormularVerwaltungState {}
