import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagrambloc/features/profile_setup/bloc/profile_event.dart';
import 'package:instagrambloc/features/profile_setup/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  File? image;

  ProfileBloc() : super(InitilState()) {
    on<FetchImage>(_fetchImage);
  }

  _fetchImage(FetchImage event, Emitter emit) async {
    emit(LoadingState());
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      image = File(pickedFile.path);
      emit(LoadedState(image!));
    }
  }
}
