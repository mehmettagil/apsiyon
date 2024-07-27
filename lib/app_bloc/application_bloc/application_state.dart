import 'package:equatable/equatable.dart';

abstract class ApplicationState extends Equatable {
  const ApplicationState();

  @override
  List<Object> get props => [];
}

class ApplicationInitial extends ApplicationState {}

class ApplicationLoading extends ApplicationState {}

class ApplicationSuccess extends ApplicationState {}

class ApplicationFailure extends ApplicationState {
  final String message;

  const ApplicationFailure(this.message);

  @override
  List<Object> get props => [message];
}
