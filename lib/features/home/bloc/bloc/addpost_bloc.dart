import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'addpost_event.dart';
part 'addpost_state.dart';

class AddpostBloc extends Bloc<AddpostEvent, AddpostState> {
  AddpostBloc() : super(AddpostInitial()) {
    on<AddpostEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
