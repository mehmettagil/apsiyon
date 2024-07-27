part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    required this.username,
    required this.password,
    required this.processFailureOrUnitOption,
  });

  factory LoginState.initial() {
    return LoginState(
      username: "",
      password: "",
      processFailureOrUnitOption: none(),
    );
  }

  final String username;
  final String password;
  final Option<Either<LoginRepositoryFailure, bool>> processFailureOrUnitOption;

  LoginState copyWith({
    String? username,
    String? password,
    Option<Either<LoginRepositoryFailure, bool>>? processFailureOrUnitOption,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      processFailureOrUnitOption:
          processFailureOrUnitOption ?? this.processFailureOrUnitOption,
    );
  }

  @override
  List<Object> get props => [username, password, processFailureOrUnitOption];
}
