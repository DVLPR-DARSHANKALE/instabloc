import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object?> get props => [];
}

class InitilState extends ProfileState {}

class PickImageState extends ProfileState {}

class ImageLoadingState extends PickImageState {}

class ImageLoadedState extends PickImageState {
  final File image;
  ImageLoadedState(this.image);
  @override
  List<Object?> get props => [image];
}

class ErrorState extends ProfileState {
  final String error;
  const ErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

class UsernameState extends ProfileState {}

class UsernameAvailable extends UsernameState {}

class UsernameNotAvailable extends UsernameState {}

class Process extends ProfileState {}

class ProcessLoading extends Process {}

class ProcessSuccess extends Process {}

class ProcessFailed extends Process {
  final String error;

  ProcessFailed(this.error);

  @override
  List<Object?> get props => [error];
}
