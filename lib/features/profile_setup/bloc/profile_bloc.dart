import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagrambloc/features/profile_setup/bloc/profile_event.dart';
import 'package:instagrambloc/features/profile_setup/bloc/profile_state.dart';
import 'package:instagrambloc/features/profile_setup/repository/profile_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  File? image;
  ProfileRepository repository;

  ProfileBloc(this.repository) : super(InitilState()) {
    on<FetchImage>(_fetchImage);
    on<CheckUsername>(_onCheckUsername);
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

  _onCheckUsername(CheckUsername event, Emitter emit) async {
    try {
      await repository.checkUsername(event.username);
      emit(UsernameAvailable());
    } catch (e) {
      emit(UsernameNotAvailable());
    }
  }
}
