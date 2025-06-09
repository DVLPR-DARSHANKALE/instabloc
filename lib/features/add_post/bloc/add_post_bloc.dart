import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagrambloc/features/add_post/bloc/add_post_event.dart';
import 'package:instagrambloc/features/add_post/bloc/add_post_state.dart';
import 'package:instagrambloc/features/add_post/repository/add_post_repository.dart';

class AddPostBloc extends Bloc<AddPostEvent, AddPostState> {
  List<File> imagesFiles = [];
  AddPostRepository repository;

  AddPostBloc(this.repository) : super(InitialState()) {
    on<PickImageevent>(_onPickImage);
    on<UploadImageEvent>(_onUploadImage);
  }
  //______________________________________________________________________________________________________________//

  _onPickImage(PickImageevent event, Emitter emit) async {
    try {
      final List<XFile> pickedFiles = await ImagePicker().pickMultiImage();

      if (pickedFiles.isNotEmpty) {
        imagesFiles = pickedFiles.map((xfile) => File(xfile.path)).toList();
        emit(PickSuccessState(imagesFiles));
      } else {
        emit(PickfailureState("No images selected"));
      }
    } catch (e) {
      emit(PickfailureState("Error: ${e.toString()}"));
    }
  }
  //______________________________________________________________________________________________________________//

  _onUploadImage(UploadImageEvent event, Emitter emit) async {
    try {
      await repository.uploadImages(event.uploadimages);
      emit(UpLoadImageSuccessState());
    } catch (e) {
      emit(UpLoadImageFailureState(e.toString()));
    }
  }
}
