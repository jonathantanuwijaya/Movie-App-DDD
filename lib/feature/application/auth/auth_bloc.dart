import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movieapp/feature/domain/auth/auth_failure.dart';
import 'package:movieapp/feature/domain/auth/i_auth_facade.dart';
import 'package:movieapp/feature/domain/auth/value_objects.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;
  AuthBloc(this._authFacade) : super(AuthState.iniitial()) {
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
      await _performSignIn(emit);
    }, checkAuthStatus: (event) async {
      var authStatus = state.authenticated;
      emit(state.copyWith(authenticated: authStatus));
    });
  }

  FutureOr<void> _performSignIn(Emitter<AuthState> emit) async {
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    Either<AuthFailure, Unit>? failureOrSuccess;

    if (isEmailValid && isPasswordValid) {
      emit(state.copyWith(
          authFailureOrSucessOption: none(),
          isSubmitting: true,
          showErrorMessages: AutovalidateMode.always));
      final result = await _authFacade.signInWithEmailAndPassword(
          emailAddress: state.emailAddress, password: state.password);

      emit(state.copyWith(
          authenticated: result.isRight(),
          authFailureOrSucessOption: some(result)));
    }

    emit(state.copyWith(
        isSubmitting: false,
        showErrorMessages: AutovalidateMode.always,
        authFailureOrSucessOption: optionOf(failureOrSuccess)));
  }
}
