import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}

class InitailState extends AuthState {}

class SignUpLoadingState extends AuthState {}

class SignUpSuccessState extends AuthState {}

class SignUpfailureState extends AuthState {
  final String error;

  const SignUpfailureState(this.error);
  @override
  List<Object?> get props => [error];
}
// _____________________________________________________//

class SignInLoadingState extends AuthState {}

class SignInSuccessState extends AuthState {}

class SignInfailureState extends AuthState {
  final String error;

  const SignInfailureState(this.error);
  @override
  List<Object?> get props => [error];
}
// _____________________________________________________//

class TokenSuccessState extends AuthState {}

class TokenErrorState extends AuthState {}

// _____________________________________________________//

class SignOutSuccessfulState extends AuthState {}

// _____________________________________________________//

class UsernameState extends AuthState {}

class UserNameAvailable extends UsernameState {}

class UserNameNotAvailable extends UsernameState {}

// _____________________________________________________//
