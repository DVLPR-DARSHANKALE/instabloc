import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class AddPostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends AddPostState {}

class PickImageState extends AddPostState {}

class PickSuccessState extends PickImageState {
  final List<File> images;
  PickSuccessState(this.images);
  @override
  List<Object?> get props => [images];
}

class PickfailureState extends PickImageState {
  final String error;
  PickfailureState(this.error);
  @override
  List<Object?> get props => [error];
}
//________________________________________________________________________________________________________//

class UpLoadImageState extends AddPostState {}

class UpLoadImageSuccessState extends UpLoadImageState {}

class UpLoadImageFailureState extends UpLoadImageState {
  final String error;
  UpLoadImageFailureState(this.error);
  @override
  List<Object?> get props => [error];
}
