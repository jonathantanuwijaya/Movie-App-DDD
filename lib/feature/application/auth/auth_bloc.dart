import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movieapp/feature/domain/auth/auth_failure.dart';
import 'package:movieapp/feature/domain/auth/value_objects.dart';
import 'package:movieapp/feature/infrastructure/auth/i_auth_facade.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // final IAuthFacade _authFacade;
  AuthBloc() : super(AuthState.iniitial()) {
    on<AuthEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(AuthEvent event, Emitter<AuthState> emit) async {
    await event.map(emailChanged: (event) async {
      emit(state.copyWith(
          emailAddress: EmailAddress(event.emailStr),
          authFailureOrSucessOption: none()));
    }, passwordChanged: (event) async {
      emit(state.copyWith(
          password: Password(event.passwordStr),
          authFailureOrSucessOption: none()));
    }, signIn: (event) async {
      return _performSignIn(emit);
    });
  }

  FutureOr<void> _performSignIn(
      //     void Function({
      //   required EmailAddress emailAddress,
      //   required Password password,
      // })
      //         forwardedCall,
      Emitter<AuthState> emit) async {
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    Either<AuthFailure, Unit>? failureOrSuccess;
    if (isEmailValid && isPasswordValid) {
      emit(state.copyWith(
        authFailureOrSucessOption: none(),
        isSubmitting: true,
      ));

      emit(state.copyWith(
          authFailureOrSucessOption: some(right(unit)),
          isSubmitting: false));
    }

    emit(state.copyWith(
        isSubmitting: false,
        authFailureOrSucessOption: optionOf(failureOrSuccess)));
  }
}
