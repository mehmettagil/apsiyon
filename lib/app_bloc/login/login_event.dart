part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginFetchEvent extends LoginEvent {
  const LoginFetchEvent();
}

class LoginUserNameChangeEvent extends LoginEvent {
  final String username;

  const LoginUserNameChangeEvent({required this.username});
}

class LoginUserNameCheckEvent extends LoginEvent {
  const LoginUserNameCheckEvent();
}

class LoginPasswordChangeEvent extends LoginEvent {
  final String password;

  const LoginPasswordChangeEvent({required this.password});
}

class LoginClearEvent extends LoginEvent {
  const LoginClearEvent();
}

class LoginCompleteEvent extends LoginEvent {
  const LoginCompleteEvent();
}
