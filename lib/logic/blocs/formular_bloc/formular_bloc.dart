import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'formular_event.dart';
part 'formular_state.dart';

class FormularBloc extends Bloc<FormularEvent, FormularState> {
  FormularBloc() : super(FormularInitial()) {
    on<FormularEvent>((event, emit) {});
  }
}
