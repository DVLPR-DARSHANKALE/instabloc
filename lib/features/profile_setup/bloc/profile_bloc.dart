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
    on<FetchImageEvent>(_fetchImage);
    on<CheckUsernamEvent>(_checkUsername);
    on<ProccedEvent>(_proccedButton);
  }

  _fetchImage(FetchImageEvent event, Emitter emit) async {
    emit(ImageLoading());
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      image = File(pickedFile.path);
      emit(ImageLoaded(image!));
    }
  }

  _checkUsername(CheckUsernamEvent event, Emitter emit) async {
    try {
      await repository.cheackUserName(event.userename);
      emit(UserNameAvailable());
    } catch (e) {
      emit(UserNameNotAvailable());
    }
  }

  _proccedButton(ProccedEvent event, Emitter emit) async {
    emit(ProccedLoadingState());

    try {
      if (image != null) {
        await repository.uploadProfilePic(image!);
      }
      await repository.proccedButton(
        name: event.name,
        username: event.username,
        bio: event.bio,
      );
      emit(ProccedSuccessState());
    } catch (e) {
      emit(ProccedErrorState(e.toString()));
    }
  }
}
