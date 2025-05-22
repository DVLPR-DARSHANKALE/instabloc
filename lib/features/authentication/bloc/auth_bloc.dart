import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagrambloc/features/authentication/bloc/auth_event.dart';
import 'package:instagrambloc/features/authentication/bloc/auth_state.dart';
import 'package:instagrambloc/features/authentication/repository/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(InitialState()) {
    on<SignUpEvent>(_onSignUpEvent);
    on<SignInEvent>(_onSignInEvent);
    on<RefreshTokenEvent>(_onRefreshTokenEvent);
    on<SignOutEvent>(_onSignOutEvent);
  }

  _onSignUpEvent(SignUpEvent event, Emitter emit) async {
    emit(SignUpLoading());
    try {
      await repository.signUp(email: event.email, password: event.password);
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpFailure(e.toString()));
    }
  }

  _onSignInEvent(SignInEvent event, Emitter emit) async {
    emit(SignInLoading());
    try {
      await repository.signIn(email: event.email, password: event.password);
      emit(SignInSuccess());
    } catch (e) {
      emit(SignInFailure(e.toString()));
    }
  }

  _onRefreshTokenEvent(RefreshTokenEvent event, Emitter emit) async {
    try {
      await repository.refreshToken();
      emit(TokenRefreshedSuccessfully());
    } catch (e) {
      emit(TokenRefreshError());
    }
  }

  _onSignOutEvent(SignOutEvent event, Emitter emit) async {
    try {
      await repository.signOut();
      emit(SignOutSuccessfull());
    } catch (e) {}
  }
}
