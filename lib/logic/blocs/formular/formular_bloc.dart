import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'formular_event.dart';
part 'formular_state.dart';

class FormularBloc extends Bloc<FormularEvent, FormularState> {
  FormularBloc() : super(FormularInitial()) {
    on<FormularEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
