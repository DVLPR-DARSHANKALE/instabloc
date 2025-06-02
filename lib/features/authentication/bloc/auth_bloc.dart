import 'package:bloc/bloc.dart';
import 'package:instagrambloc/features/authentication/bloc/auth_event.dart';
import 'package:instagrambloc/features/authentication/bloc/auth_state.dart';
import 'package:instagrambloc/features/authentication/repository/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository repository;
  AuthBloc(this.repository) : super(InitailState()) {
    on<SignUpEvent>(_onSignUpEvent);
    on<SignInEvent>(_onSignInEvent);
    on<TokenEvent>(_onRefreshTokenEvent);
    on<SignOutEvent>(_onSignOutEvent);
  }

  _onSignUpEvent(SignUpEvent event, Emitter emit) async {
    emit(SignUpLoadingState());
    try {
      await repository.signUp(email: event.email, password: event.password);
      emit(SignUpSuccessState());
    } catch (e) {
      emit(SignUpfailureState(e.toString()));
    }
  }

  _onSignInEvent(SignInEvent event, Emitter emit) async {
    emit(SignInLoadingState());
    try {
      await repository.signIn(email: event.email, password: event.password);
      emit(SignInSuccessState());
    } catch (e) {
      emit(SignInfailureState(e.toString()));
    }
  }

  _onRefreshTokenEvent(TokenEvent event, Emitter emit) async {
    try {
      await repository.refreshTokenService();
      emit(TokenSuccessState());
    } catch (e) {
      emit(TokenErrorState());
    }
  }

  _onSignOutEvent(SignOutEvent event, Emitter emit) async {
    try {
      await repository.signOut();
      emit(SignOutSuccessfulState());
    } catch (e) {
      rethrow;
    }
  }
}
