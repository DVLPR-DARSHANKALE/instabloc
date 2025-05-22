import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object?> get props => [];
}

class LoadingState extends ProfileState {}

class InitilState extends ProfileState {}

class LoadedState extends ProfileState {
  final File image;
  const LoadedState(this.image);
  @override
  List<Object?> get props => [image];
}

class ErrorState extends ProfileState {
  final String error;
  const ErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

class UsernameAvailable extends ProfileState {}

class UsernameNotAvailable extends ProfileState {}

class Processing extends ProfileState {}

class ProcessSuccess extends ProfileState {}

class ProcessFailed extends ProfileState {
  final String error;

  const ProcessFailed(this.error);

  @override
  List<Object?> get props => [error];
}
