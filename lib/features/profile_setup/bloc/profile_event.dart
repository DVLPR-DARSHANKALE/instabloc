import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object?> get props => [];
}

class FetchImageEvent extends ProfileEvent {}

class CheckUsernamEvent extends ProfileEvent {
  final String userename;
  const CheckUsernamEvent(this.userename);
  @override
  List<Object?> get props => [userename];
}

class ProccedEvent extends ProfileEvent {
  final String name;
  final String username;
  final String bio;
  const ProccedEvent(this.bio, this.name, this.username);
  @override
  List<Object?> get props => [bio, name, username];
}
