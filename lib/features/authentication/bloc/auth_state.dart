import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class InitialState extends AuthState {}

class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {}

class SignUpFailure extends AuthState {
  final String message;

  const SignUpFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class SignInLoading extends AuthState {}

class SignInSuccess extends AuthState {}

class SignInFailure extends AuthState {
  final String message;

  const SignInFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class TokenRefreshedSuccessfully extends AuthState {}

class TokenRefreshError extends AuthState {}

class SignOutSuccessfull extends AuthState {}
