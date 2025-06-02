import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object?> get props => [];
}

class InitilState extends ProfileState {}
// _____________________________________________________//

class ImagepickState extends ProfileState {}

class ImageLoading extends ImagepickState {}

class ImageLoaded extends ImagepickState {
  final File image;
  ImageLoaded(this.image);
  @override
  List<Object?> get props => [image];
}

class ImageError extends ImagepickState {
  final String error;
  ImageError(this.error);
  @override
  List<Object?> get props => [error];
}
// _____________________________________________________//

class UsernameState extends ProfileState {}

class UserNameAvailable extends UsernameState {}

class UserNameNotAvailable extends UsernameState {}

// _____________________________________________________//

class ProccedButtonState extends ProfileState {}

class ProccedSuccessState extends ProccedButtonState {}

class ProccedLoadingState extends ProccedButtonState {}

class ProccedErrorState extends ProccedButtonState {
  final String error;
  ProccedErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

// _____________________________________________________//
