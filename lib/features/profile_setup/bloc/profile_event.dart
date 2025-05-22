import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object?> get props => [];
}

class FetchImage extends ProfileEvent {}

class CheckUsername extends ProfileEvent {
  final String username;

  const CheckUsername(this.username);

  @override
  List<Object?> get props => [username];
}

class ProceedEvent extends ProfileEvent {}
