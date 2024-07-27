import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:apsiyon/basic_structure/failure/login_repository_failure.dart';
import 'package:apsiyon/basic_structure/repository/users_repository/i_login_repository.dart';
import 'package:bloc/bloc.dart';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._iUsersRepository) : super(LoginState.initial()) {
    on<LoginFetchEvent>(
      _onLoginFetchEvent,
    );

    on<LoginUserNameChangeEvent>(
      _onLoginEmailChangeEvent,
    );
    on<LoginPasswordChangeEvent>(
      _onLoginPasswordChangeEvent,
    );
    on<LoginClearEvent>(
      _onLoginClearEvent,
    );
    on<LoginCompleteEvent>(
      _onLoginCompleteEvent,
    );
  }

  final ILoginRepository _iUsersRepository;
  addLoginEmailChangeEvent({required String username}) {
    add(LoginUserNameChangeEvent(username: username));
  }

  addLoginPasswordChangeEvent({required String password}) {
    add(LoginPasswordChangeEvent(password: password));
  }

  addLoginCompleteEvent() {
    add(const LoginCompleteEvent());
  }

  Future<void> _onLoginEmailChangeEvent(
      LoginUserNameChangeEvent event, Emitter<LoginState> emit) async {
      emit(state.copyWith(username: event.username));
    
  }

  Future<void> _onLoginPasswordChangeEvent(
      LoginPasswordChangeEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onLoginCompleteEvent(
      LoginCompleteEvent event, Emitter<LoginState> emit) async {
    try {
      if (state.username.isNotEmpty && state.password.isNotEmpty) {
        final checkLogin = await _iUsersRepository.login(
            email: state.username, password: state.password);
        checkLogin.fold(
          (failure) {
            emit(state.copyWith(
              processFailureOrUnitOption: some(left(failure)),
            ));
          },
          (success) {
            if (success) {
              emit(state.copyWith(
                processFailureOrUnitOption: some(right(true)),
              ));
            } else {
              emit(state.copyWith(
                processFailureOrUnitOption: some(
                  left(
                    const LoginRepositoryUnknownFailure(
                        "Email or password is incorrect"),
                  ),
                ),
              ));
            }
          },
        );
      } else {
        emit(state.copyWith(
          processFailureOrUnitOption: some(
            left(
              const LoginRepositoryUnknownFailure("Email or password is empty"),
            ),
          ),
        ));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _onLoginClearEvent(
      LoginClearEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(processFailureOrUnitOption: none()));
  }

  Future<void> _onLoginFetchEvent(
      LoginFetchEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(username: "", password: ""));
  }
}
