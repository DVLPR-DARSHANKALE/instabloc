import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class AddPostEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PickImageevent extends AddPostEvent {}

class UploadImageEvent extends AddPostEvent {
  final File uploadimages;
  UploadImageEvent(this.uploadimages);

  @override
  List<Object?> get props => [uploadimages];
}
