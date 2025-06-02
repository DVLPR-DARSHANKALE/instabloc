import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagrambloc/features/bottom_navi/bloc/bottomnavi_event.dart';
import 'package:instagrambloc/features/bottom_navi/bloc/bottomnavi_state.dart';

class BottomnaviBloc extends Bloc<BottomnaviEvent, BottomnaviState> {
  int selecteTab = 0;

  BottomnaviBloc() : super(BottomnaviState(0)) {
    on<ChangeTab>(_onChangeTab);
  }

  _onChangeTab(ChangeTab event, Emitter emit) {
    selecteTab = event.selectedIndex;
    emit(BottomnaviState(selecteTab));
  }
}
