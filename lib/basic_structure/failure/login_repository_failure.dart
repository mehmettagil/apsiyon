import 'package:equatable/equatable.dart';

abstract class LoginRepositoryFailure extends Equatable {
  const LoginRepositoryFailure();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class LoginRepositoryInternalFailure extends LoginRepositoryFailure {
  const LoginRepositoryInternalFailure();
}

class LoginRepositoryNotFoundFailure extends LoginRepositoryFailure {
  const LoginRepositoryNotFoundFailure();
}

class LoginRepositoryConnectionFailure extends LoginRepositoryFailure {
  const LoginRepositoryConnectionFailure();
}

class LoginRepositoryUnknownFailure extends LoginRepositoryFailure {
  const LoginRepositoryUnknownFailure(this._message);
  final String? _message;

  @override
  String toString() {
    return "LoginRepositoryUnknownFailure(); Exception message was: $message";
  }

  @override
  List<Object?> get props => [_message];

  String? get message => _message;
}
